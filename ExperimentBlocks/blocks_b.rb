module ExperimentBlocks
  class BlocksB
    def initialize(&block)
      @blk = block
    end

    def defer_execute_block
      @blk.call
    end
  end
end

x = ExperimentBlocks::BlocksB.new do
  a = 10
  b = 20
  a + b
end
# prints the return value of the block
puts x.defer_execute_block