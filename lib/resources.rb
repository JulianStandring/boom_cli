require 'thor'
require 'rest-client'
require 'json'

module GiantBomb

############## Search Class ##############
  class Search < GiantBomb::Entrypoint

    desc 'search json [QUERY]', 'Get json result using QUERY'
    def json(args)
      api_key = invoke "config", []
      say "⏳ Asking the api about QUERY: #{args}"
      search_response  = RestClient.get('https://www.giantbomb.com/api/search', params: {api_key: api_key, resources: 'game', format: 'json', query: args})
      json  = JSON.parse(search_response.body)
      if json["number_of_total_results"] > 1
        say "✅ #{json["number_of_total_results"]} results found."
        say "💥💥💥💥💥💥 boom json results 💥💥💥💥💥💥\n #{json}" if ARGV.include? 'json'
        say "💥💥💥💥💥💥 boom json results end 💥💥💥💥💥💥" if ARGV.include? 'json'
      else
        say "⛔ No results found!"
        exit
      end
      return json
    end

    desc 'search guid [QUERY]', 'Get json for guids using QUERY'
    def guid(args)
      json = invoke "json", [args]
      results = json["results"]
      guid_hash = Hash.new
      results.each do |result|
        guid_hash[result["name"]] = result["guid"]
      end
      say "⚠️  only working with first 10 of a possible #{json["number_of_total_results"]}"
      say "💥💥💥💥💥💥 boom json results 💥💥💥💥💥💥\n #{guid_hash}" if ARGV.include? 'guid'
      say "💥💥💥💥💥💥 boom json results end 💥💥💥💥💥💥" if ARGV.include? 'guid'
      return guid_hash
    end

    desc 'search id [QUERY]', 'Get json for ids using QUERY'
    def id(args)
      json = invoke "json", [args]
      results = json["results"]
      id_hash = Hash.new
      results.each do |result|
        id_hash[result["name"]] = result["id"]
      end
      say "⚠️  only working with first 10 of a possible #{json["number_of_total_results"]}"
      say "💥💥💥💥💥💥 boom json results 💥💥💥💥💥💥\n #{id_hash}" if ARGV.include? 'id'
      say "💥💥💥💥💥💥 boom json results end 💥💥💥💥💥💥" if ARGV.include? 'id'
      return id_hash
    end

  end
############## End Search Class ##############

############## Game Class ##############
  class Game < GiantBomb::Entrypoint

    desc 'game json [GUID]', 'Get json results using a game GUID'
    def json(args)
      api_key = invoke "config", []
      say "⏳ Asking the api about GUID: #{args}"
      game_response  = RestClient.get("https://www.giantbomb.com/api/game/#{args}", params: {api_key: api_key, format: 'json', guid: args})
      json  = JSON.parse(game_response.body)
      say "✅ #{json["number_of_total_results"]} results found." if ARGV.include? 'json'
      say "💥💥💥💥💥💥 boom json results 💥💥💥💥💥💥\n #{json}" if ARGV.include? 'json'
      say "💥💥💥💥💥💥 boom json results end 💥💥💥💥💥💥" if ARGV.include? 'json'
      return json
    end

    desc 'game details [GUID]', 'Prints details for a game GUID'
    def details(args)
      json = invoke "json", [args]
      results = json["results"]
      say "💥💥 Detail summary for \"#{results["name"]}\" (released: #{results["original_release_date"]}) 💥💥"
      say "💥 Game Deck:\n #{results["deck"]}" if results["deck"]
      say "💥 Game Site Detail URL:\n #{results["site_detail_url"]}" if results["site_detail_url"]
      say "💥 Game Aliases:\n #{results["aliases"]}" if results["aliases"]
      say "💥 Game ID: #{results["id"]}" if results["id"]
      say "💥💥💥💥💥💥 end 💥💥💥💥💥💥"
    end

    desc 'game dlcs [GUID]', 'Get json for dlcs using a game GUID'
    def dlcs(args)
      json = invoke "json", [args]
      results = json["results"]
      if results["dlcs"]
        say "💥💥💥💥💥💥 boom json results 💥💥💥💥💥💥\n #{results["dlcs"]}" if ARGV.include? 'dlcs'
      say "💥💥💥💥💥💥 boom json results end 💥💥💥💥💥💥" if ARGV.include? 'dlcs'
      else
        say "⛔ No dlcs results found for \"#{results["name"]}\"."
        exit
      end
      return results
    end

  end
############## End Game Class ##############

############## Dlcs Class ##############
  class Dlcs < GiantBomb::Entrypoint

    desc 'dlcs json [ID]', 'Get json results using a game ID'
    def json(args)
      api_key = invoke "config", []
      game_id = "game:#{args}"
      sort_field = "release_date:asc"
      say "⏳ Asking the api about ID: #{args}"
      dlcs_response  = RestClient.get("https://www.giantbomb.com/api/dlcs/", params: {api_key: api_key, format: 'json', filter: game_id, sort: sort_field})
      json  = JSON.parse(dlcs_response.body)
      say "✅ #{json["number_of_total_results"]} results found." if ARGV.include? 'json'
      say "💥💥💥💥💥💥 boom json results 💥💥💥💥💥💥\n #{json}" if ARGV.include? 'json'
      say "💥💥💥💥💥💥 boom json results end 💥💥💥💥💥💥" if ARGV.include? 'json'
      return json
    end

  end
############## End Dlcs Class ##############

end
