def loadCommands
puts File.dirname(__FILE__)
  Dir["#{File.dirname(__FILE__)}/commands/*.rb"].sort.each do |arqCommand|

    load arqCommand

    require arqCommand

    bob = File.readlines(arqCommand) { |line| line.split.map(&:to_s).join }

    command = bob[0][7..bob[0].length]

    command.delete!("\n")

    command = Object.const_get(command)

    Bot.include_commands command

    puts "Command #{command} successfully loaded!"

  end

end



loadCommands

Bot.ready do |event|

  event.bot.game = 'Estou estuprando o astah'

end



puts 'Bot is ready!'



Bot.run

