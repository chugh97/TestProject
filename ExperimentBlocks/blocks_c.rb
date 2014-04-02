require 'active_support/core_ext/date'
module ExperimentBlocks
  class BlocksC
    def initialize(&block)
      @blk = block
    end

    def defer_execute_block
      @blk.call
    end
  end

  class BlocksC1
    def initialize(&block)
      @blk = block
    end

    def defer_execute_block
      process_person_age
    end

    private
    def process_person_age
      person = @blk.call
      (DateTime.now - person.dob).to_i
    end
  end

  class Person
    attr_accessor :name, :dob
  end
end

x = ExperimentBlocks::BlocksC1.new do
  @t = ExperimentBlocks::Person.new
  @t.name = "Shaleen"
  @t.dob = DateTime.new(2013,12,12)
  @t
end
# prints the return value of the block
puts x.defer_execute_block