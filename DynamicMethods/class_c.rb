module DynamicMethods
  class ClassC

    def another_public_method
      puts "Another public method"
    end

    def another_public_method_with_parameter(user_name)
      puts "Another public method #{user_name}"
    end

    private
    def method_cannot_be_called_normally(user_name)
      puts "I am private, and this cannot be called #{user_name}"
    end
  end
end

x = DynamicMethods::ClassC.new
# Params need to passed using a comma after the symbol
x.send :method_cannot_be_called_normally, "chughs"

p_method = x.method :another_public_method
p_method.call

p_method = x.method :another_public_method_with_parameter
p_method.call("dummy_user")