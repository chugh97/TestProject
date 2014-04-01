module Accessors
  class ClassA
    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def method_a
      puts name
    end
  end
end

classA = Accessors::ClassA.new("shaleen")
classA.method_a

