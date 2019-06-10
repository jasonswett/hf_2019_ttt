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
    return 'MEOW MEOW, MOTHERFUCKER!' if @board.draw?
    return "#{@board.winner} wins" if @board.has_winner?
    @board.to_s
  end
end
