module MethodMissing
  class ClassA

    def method_missing(method_name,*args, &block)
      puts "The method #{method_name} is not found and was called with #{args}"
    end
  end
end

MethodMissing::ClassA.new.a_method_which_does_not_exist(10,20,30)

MethodMissing::ClassA.new.another_method_which_does_not_exist("a","b")

