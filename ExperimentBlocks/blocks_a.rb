module ExperimentBlocks
  class BlocksA
    def initialize(&block)
      yield block
    end
  end
end

x = ExperimentBlocks::BlocksA.new{ puts "External code called" }