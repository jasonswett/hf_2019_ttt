require 'pry'
require_relative '../app/tic_tac_toe_board'

class Interface
  def initialize
    @board = TicTacToeBoard.new
  end

  def run(commands)
    commands.each_with_index do |command, index|
      player = ['x', 'o'][index % 2]

      if !position_valid?(command.values.first)
        @next_message = "That's not how we do things around here"
        return
      end

      position = command.values.first.to_i
      @board.mark(player, position)
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
