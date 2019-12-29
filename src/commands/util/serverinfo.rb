module CrisRuby
  module DiscordCommands
    module ServerInfo
      extend Discordrb::Commands::CommandContainer
      command(%i[sv sinfo serverinfo]) do |event|
        server = event.server
        event.channel.send_embed do |embed|
          embed.author = {
            name: "Informações do servidor",
            icon_url: server.icon_url || nil
          }
          embed.add_field(name: 'Nome: ', value: server.name, inline:true)
          embed.add_field(name: 'Id: ', value: server.id, inline:true)
          embed.add_field(name: 'Owner: ', value: server.owner.mention, inline:true)
          embed.add_field(name: 'Membros: ',
              value: "```prolog\nO servidor possui #{server.member_count} membros```",
              inline:true)
          embed.color = 0x00ff00
          embed.timestamp = Time.now.getutc
        end
      end
    end
  end
end



