require_relative './game'
require_relative './author'
require 'json'

def file_loader(allgames, allauthors) # rubocop:todo Metrics/MethodLength
  store = './module/games.json'
  if File.exist?(store)
    file = File.open(store)

    if file.size.zero?
      allauthors.push []
      allgames.push []
    else
      storeddata = JSON.parse(File.read(store))

      storeddata.each do |data|
        games = Game.new(data['multiplayer'], data['last_played_at'], data['publish_date'])
        authors = Authors.new(data['first_name'], data['last_name'])
        allgames.push(games)
        allauthors.push(authors)
        author.add_item(games)
      end
    end
    file.close
  else
    allauthors.push []
    allgames.push []
  end
end

def save_file(_item)
  File.new('.module/games.json', 'w+') unless File.exist?('./module/games.json')
  if File.empty?('./module/games.json')
    games = []
  else
    data = File.read('./module/games.json').split
    games = JSON.parse(data.join)
  end
  games.push({ 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
               'publish_date' => game.publish_date, 'first_name' => game.author.first_name,
               'last_name' => game.author.last_name })
  File.write('./module/games.json', JSON.generate(games))
end
