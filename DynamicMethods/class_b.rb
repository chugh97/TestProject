module DynamicMethods
  class ClassB

    define_method :show do |user_name|
      puts "Hello this method is defined on the fly #{user_name}"
    end
  end
end

x = DynamicMethods::ClassB.new.show("chughs")
