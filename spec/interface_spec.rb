require_relative '../lib/interface'

RSpec.describe Interface do
  context 'marking X' do
    it 'shows the board' do
      script = [
        { 'Move for player X' => '0' },
        { 'Move for player O' => 'quit' }
      ]

      interface = Interface.new(CommandScriptInputStrategy.new(script))
      interface.run

      expected_output = "X |   |  \n  |   |  \n  |   |  "
      expect(interface.next_message).to eq(expected_output)
    end
  end

  context 'multiple moves' do
    it 'shows a winner' do
      script = [
        { 'Move for player X' => '0' },
        { 'Move for player O' => '4' },
        { 'Move for player X' => 'quit' },
      ]

      interface = Interface.new(CommandScriptInputStrategy.new(script))
      interface.run

      expected_output = "X |   |  \n  | O |  \n  |   |  "
      expect(interface.next_message).to eq(expected_output)
    end
  end

  context 'X wins' do
    it 'shows a winner' do
      script = [
        { 'Move for player X' => '0' },
        { 'Move for player O' => '4' },
        { 'Move for player X' => '1' },
        { 'Move for player O' => '6' },
        { 'Move for player X' => '2' },
        { 'Move for player O' => 'quit' }
      ]

      interface = Interface.new(CommandScriptInputStrategy.new(script))
      interface.run

      expect(interface.next_message).to eq('X wins')
    end
  end

  context "cat's game" do
    it "says it's a cat's game" do
      script = [
        { 'Move for player X' => '4' },
        { 'Move for player O' => '0' },
        { 'Move for player X' => '1' },
        { 'Move for player O' => '7' },
        { 'Move for player X' => '5' },
        { 'Move for player O' => '3' },
        { 'Move for player X' => '6' },
        { 'Move for player O' => '2' },
        { 'Move for player X' => 'quit' }
      ]

      interface = Interface.new(CommandScriptInputStrategy.new(script))
      interface.run

      expect(interface.next_message).to eq('MEOW MEOW, MOTHERFUCKER!')
    end
  end

  context 'invalid inputs' do
    context 'string' do
      it 'shows an error message' do
        script = [
          { 'Move for player X' => 'rook takes queen' },
          { 'Move for player O' => 'quit' }
        ]

        interface = Interface.new(CommandScriptInputStrategy.new(script))
        interface.run

        expect(interface.next_message).to eq("That's not how we do things around here")
      end
    end

    context 'too big a number' do
      it 'shows an error message' do
        script = [
          { 'Move for player X' => '52' },
          { 'Move for player O' => 'quit' }
        ]

        interface = Interface.new(CommandScriptInputStrategy.new(script))
        interface.run

        expect(interface.next_message).to eq("That's not how we do things around here")
      end
    end

    context 'negative number' do
      it 'shows an error message' do
        script = [
          { 'Move for player X' => '-3' },
          { 'Move for player O' => 'quit' }
        ]

        interface = Interface.new(CommandScriptInputStrategy.new(script))
        interface.run

        expect(interface.next_message).to eq("That's not how we do things around here")
      end
    end
  end

  #context 'invalid input followed by valid input' do
    #it 'still works' do
      #script = [
        #{ 'Move for player X' => 'hi' },
        #{ 'Move for player X' => '0' },
        #{ 'Move for player O' => '4' },
        #{ 'Move for player X' => '1' },
        #{ 'Move for player O' => '6' },
        #{ 'Move for player X' => '2' }
      #]

      #interface = Interface.new(CommandScriptInputStrategy.new(script))
      #interface.run

      #expect(interface.next_message).to eq('X wins')
    #end
  #end
end
