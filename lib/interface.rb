require 'pry'
require 'tty-prompt'
require_relative '../app/tic_tac_toe_board'

class PromptInputStrategy
  def initialize
    @prompt = TTY::Prompt.new
  end

  def ask(message)
    @prompt.ask(message)
  end
end

class CommandScriptInputStrategy
  def initialize(commands)
    @commands = commands
    @index = 0
  end

  def ask(message)
    value = @commands[@index].values.first
    @index += 1
    value
  end
end

class Interface
  def initialize(input_strategy)
    @board = TicTacToeBoard.new
    @input_strategy = input_strategy
  end

  def run
    index = 0

    loop do
      player = ['x', 'o'][index % 2]
      index += 1
      position = @input_strategy.ask("Move for player #{player.upcase}")
      return if position == 'quit'

      @next_message = nil

      if position_valid?(position)
        @board.mark(player, position.to_i)
      else
        @next_message = "That's not how we do things around here"
      end

      @board.mark(player, position.to_i)
      puts next_message
      break if @board.has_winner? || @board.draw?
    end
  end

  def next_message
    return @next_message if @next_message
    return 'MEOW MEOW, MOTHERFUCKER!' if @board.draw?
    return "#{@board.winner} wins" if @board.has_winner?
    @board.to_s
  end

  private

  def position_valid?(position)
    position.to_i.to_s == position && position.to_i >= 0 && position.to_i <= 8
  end
end
