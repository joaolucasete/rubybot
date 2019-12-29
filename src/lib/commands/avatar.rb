module Avatar
  extend Discordrb::Commands::CommandContainer

  command(%i[avatar av], max_args: 1) do |event, *code|
    user_id = code[0].to_s.scan(/\d/).join
    user = event.server.member(user_id[0]) || event.author
    event.channel.send_embed do |embed|
      embed.title = "Avatar #{user.name}"
      embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{user.avatar_url}?size=1024")
      embed.color = 0x00ff00
      embed.timestamp = Time.now.getutc
    end
  end
end