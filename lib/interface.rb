require_relative '../app/tic_tac_toe_board'

class Interface
  def initialize
    @board = TicTacToeBoard.new
  end

  def run(commands)
    commands.each_with_index do |command, index|
      player = ['x', 'o'][index % 2]
      @board.mark(player, command.values.first.to_i)
    end
  end

  def next_message
    if @board.has_winner?
      "#{@board.winner} wins"
    else
      @board.to_s
    end
  end
end
