require_relative './lib/interface'

interface = Interface.new(PromptInputStrategy.new)
interface.run
