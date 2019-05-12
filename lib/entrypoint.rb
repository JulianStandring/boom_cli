require 'thor'

module GiantBomb

  class Entrypoint < Thor
    require_relative 'resources'


    puts "Using args: #{ARGV}"
    puts

    desc 'config', 'Check for the required ENV vars'
    def config
      if ENV.key?('GIANTBOMB_API_KEY')
        api_key = ENV['GIANTBOMB_API_KEY']
        say "✅ Yay! GIANTBOMB_API_KEY exists (set to: #{api_key})"
      else
        api_key = ask("⛔ Oh No! Something's missing, enter your api key:\n")
        say "🙏 Please set your ENV var with:\n export GIANTBOMB_API_KEY=\"#{api_key}\""
      end
      return api_key
    end

    desc 'dlcs', 'Access dlcs options, requires a game ID'
    def dlcs(*args)
      GiantBomb::Dlcs.start args
    end

    desc 'game', 'Access game options, requires a game GUID'
    def game(*args)
      GiantBomb::Game.start args
    end

    desc 'search', 'Access search options'
    def search(*args)
      GiantBomb::Search.start args
    end

  end

end

GiantBomb::Entrypoint.start(ARGV)
