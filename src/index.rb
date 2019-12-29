module CrisRuby
  
  module DiscordCommands; end
  Dir["#{File.dirname(__FILE__)}/commands/**/*.rb"].each { |mod| load mod }
  
  DiscordCommands.constants.each do |mod|
    LOGGER.info "Carregando os comandos: #{mod}"
    Bot.include! DiscordCommands.const_get mod
  end

  module DiscordEvents; end
  Dir["#{File.dirname(__FILE__)}/events/**/*.rb"].each { |mod| load mod }
  DiscordEvents.constants.each do |mod|
    LOGGER.info "Carregando os eventos: #{mod}"
    Bot.include! DiscordEvents.const_get mod
  end
  
  Bot.run
end