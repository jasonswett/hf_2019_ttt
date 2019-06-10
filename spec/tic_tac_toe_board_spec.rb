require_relative '../app/tic_tac_toe_board'

RSpec.describe TicTacToeBoard do
  describe '#draw?' do
    context 'draw' do
      it 'returns true' do
        positions = [
          'o', 'x', 'o',
          'x', 'o', 'o',
          'x', 'o', 'x',
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.draw?).to be true
      end
    end

    context 'not a draw' do
      it 'returns false' do
        positions = [
          'x', 'x', 'x',
          nil, 'o', nil,
          'o', nil, nil
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.draw?).to be false
      end
    end
  end

  describe '#to_s' do
    it 'formats the board' do
      positions = [
        'x', nil, 'o',
        nil, 'x', nil,
        'o', 'o', 'x'
      ]

      board = TicTacToeBoard.new(positions)
      expect(board.to_s).to eq("X |   | O\n  | X |  \nO | O | X")
    end

    context 'when the board gets updated' do
      it 'updates the board' do
        positions = [
          nil, nil, nil,
          nil, nil, nil,
          nil, nil, nil,
        ]

        board = TicTacToeBoard.new(positions)
        board.mark('x', 0)
        expect(board.to_s).to eq("X |   |  \n  |   |  \n  |   |  ")
      end
    end
  end

  describe '#winner' do
    context 'winning column (column 0)' do
      it 'returns X' do
        positions = [
          'x', nil, nil,
          'x', nil, nil,
          'x', nil, nil
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning column (column 1)' do
      it 'returns X' do
        positions = [
          nil, 'x', nil,
          nil, 'x', nil,
          nil, 'x', nil
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning column (column 2)' do
      it 'returns X' do
        positions = [
          nil, nil, 'x',
          nil, nil, 'x',
          nil, nil, 'x'
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning row (row 0)' do
      it 'returns X' do
        positions = [
          'x', 'x', 'x',
          nil, nil, nil,
          nil, nil, nil,
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning row (row 1)' do
      it 'returns X' do
        positions = [
          nil, nil, nil,
          'x', 'x', 'x',
          nil, nil, nil,
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning row (row 2)' do
      it 'returns X' do
        positions = [
          nil, nil, nil,
          nil, nil, nil,
          'x', 'x', 'x',
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning row (diagonal from top left to bottom right)' do
      it 'returns X' do
        positions = [
          'x', nil, nil,
          nil, 'x', nil,
          nil, nil, 'x',
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winning row (diagonal from bottom left to top right)' do
      it 'returns X' do
        positions = [
          nil, nil, 'x',
          nil, 'x', nil,
          'x', nil, nil,
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('X')
      end
    end

    context 'winner is O' do
      it 'returns O' do
        positions = [
          nil, nil, nil,
          nil, nil, nil,
          'o', 'o', 'o',
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to eq('O')
      end
    end

        positions = [
          'o', 'x', 'o',
          'o', 'x', 'x',
          'x', 'o', nil,
        ]

    context "cat's game" do
      it 'returns nil' do
        positions = [
          'o', 'x', 'o',
          'x', 'o', 'o',
          'x', 'o', 'x',
        ]

        board = TicTacToeBoard.new(positions)
        expect(board.winner).to be nil
      end
    end
  end
end
