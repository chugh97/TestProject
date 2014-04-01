require 'active_support/all'

module Hooks
  module ModuleA
    def self.included(base)
      puts base
      base.extend(MyClassMethods)
    end

    def instance_method_a
      puts "This is an instance method A"
    end

    module MyClassMethods
      def class_method_a
        puts "This is class method A"
      end
    end
  end
end