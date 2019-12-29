module CrisRuby
  module DiscordCommands
    module ServerInfo
      extend Discordrb::Commands::CommandContainer
      command(%i[ban],
        required_permissions: [:ban_members],
        permission_message: 'Calma ai meu chefe! Você precisa de permissão para banir membros.',
        min_args: 1,
        max_args: 2,
        usage: 'ban [menção/id]') do |event, user|

        user_id = user.to_s.scan(/\d/).join
        user = event.server.member(user_id) || event.author
        event.respond 'não vou banilo pq ele é muito lindo'
      end
    end
  end
end



