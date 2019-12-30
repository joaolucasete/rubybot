module CrisRuby
  module DiscordCommands
    module Avatar
      extend Discordrb::Commands::CommandContainer

      command(%i[avatar av], max_args: 1) do |event, user|
        user_id = user.to_s.scan(/\d/).join
        user = event.server.member(user_id) || event.author
        event.channel.send_embed do |embed|
          embed.title = "Avatar #{user.name}"
          embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{user.avatar_url}?size=1024")
          embed.color = Bot.color
          embed.timestamp = Time.now.getutc
        end
      end
    end
  end
end