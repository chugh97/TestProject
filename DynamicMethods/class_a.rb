require 'date'

module DynamicClasses
  class ClassA
    def print(user_name)
      puts "hello #{user_name}"
    end
  end

  class ClassA #reopened original print is now old_print and print is a new method which can be anything
    alias_method :old_print, :print

    def print(user_name)
      puts DateTime.new.to_s
      old_print (user_name)
    end

  end
end

Customer = Struct.new(:id, :name, :dob)
x = Customer.new
x.id = 1
x.name = "Shaleen"
x.dob = "sssss"
puts x.inspect

y = DynamicClasses::ClassA.new
y.print("chughs")

