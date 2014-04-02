module UnderstandingSelf
  class ClassA
    attr_accessor :status

    def initialize(&block)
      instance_eval(&block)
    end
  end
end


x = UnderstandingSelf::ClassA.new do
  self.status = 10
end

puts x.inspect

# Class eval to add more attr_accessors
UnderstandingSelf::ClassA.class_eval do
  attr_accessor :name

  define_method :method_on_the_fly do |*args ,&block|
    puts "I am a method on the fly"
  end
end

y = UnderstandingSelf::ClassA.new do
  self.status = 20
  self.name = "shaleen"
end

puts y.inspect

y.method_on_the_fly
