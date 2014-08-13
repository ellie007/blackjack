require_relative 'lib/blackjack'
require_relative 'lib/command_line'
require_relative 'lib/strings'

@strings = Strings.new
puts @strings.welcome_message

@io = CommandLine.new
@game = Blackjack.new(@io, @strings)
@game.begin_game


