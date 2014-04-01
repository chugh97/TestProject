module Accessors
  class ClassA
    attr_reader :name
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

puts classA.name

classA.name = "dave"

#Difference between reader and writer
puts classA.name