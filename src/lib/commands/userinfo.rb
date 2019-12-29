module Userinfo

  extend Discordrb::Commands::CommandContainer

  command(%i[ui uinfo useri userinfo], max_args: 1) do |event, user|

    user_id = user.to_s.scan(/\d/).join
    user = event.server.member(user_id) || event.author
    event.channel.send_embed do |embed|
      embed.author = {
        name: "Informações de Usuário",
        icon_url: user.avatar_url || nil
      }
      embed.add_field(name: 'Nome: ', value: user.name, inline:true)
      embed.add_field(name: 'Id: ', value: user.id, inline:true)
      embed.add_field(name: 'Jogando: ', value: user.game, inline:true)
      embed.add_field(name: 'Roles: ', 
        value: user.roles.map{ |role| "<@&#{role.id}>"}.join(', '), 
        inline:true)
      embed.timestamp = Time.now
      embed.color = 0xf0f0f
    end

  end

end



