module CrisRuby
  module DiscordEvents
    module Ready
      extend Discordrb::EventContainer

      STATUS = [
        "gosto de comer o astah",
        "comendo o astah de 4",
        "astah rebolando em mim",
        "ligando para o astah gostosão"
      ]
      Bot.set_user_permission(268351613771448320, 3)

      ready do |event|
        event.bot.game = CONFIG['status'].sample
        LOGGER.event "#{event.bot.profile.distinct} está rodando"
      end
    end
  end
end