require_relative './game'
require_relative './author'
require 'json'

def file_loader(allgames, allauthors) # rubocop:todo Metrics/MethodLength
  store = './data/games.json'
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

def save_file(item)
  File.new('.data/games.json', 'w+') unless File.exist?('./data/games.json')
  if File.empty?('./data/games.json')
    games = []
  else
    data = File.read('./data/games.json').split
    games = JSON.parse(data.join)
  end
  games.push({ 'multiplayer' => item.multiplayer, 'last_played_at' => item.last_played_at,
               'publish_date' => item.publish_date, 'first_name' => item.author.first_name,
               'last_name' => item.author.last_name })
  File.write('./data/games.json', JSON.generate(games))
end
