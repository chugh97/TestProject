module Accessors
  class ClassC
    attr_writer :name
    def initialize(name)
      @name = name
    end

    def method_a
      puts @name
    end
  end
end

classA = Accessors::ClassC.new("shaleen")

# prints shaleen
classA.method_a
# assigns dave
classA.name = "dave"
# prints dave
classA.method_a
#writer cannot read
puts classA.name