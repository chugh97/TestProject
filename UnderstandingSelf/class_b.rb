module UnderstandingSelf
  class ClassB
    puts "inside class ,#{self}"

    def a_method_defined
      puts "inside method ,#{self}"
    end
  end
end
puts "outside class,#{self}"

UnderstandingSelf::ClassB.new.a_method_defined
