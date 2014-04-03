module MethodMissing
  class ClassB

    def respond_to_missing?(method_name)

    end

    def method_missing(method_name,*args, &block)
      self.class.class_eval do
        puts "calling define method"
        define_method method_name do |*args, &block|
          puts "method defined at runtime with #{args}"
        end
      end
      send method_name
    end
  end
end

MethodMissing::ClassB.new.new_method_at_runtime()
# Note second time around defined_method is not called
MethodMissing::ClassB.new.new_method_at_runtime()

