module Inheritance
  class SubClassA < Inheritance::Base
    def initialize(options)
      super
      puts "sub class initialize called"
    end

    def base_method(param)
      # super takes default parameters
      super()
     #puts "base method of sub class A #{param}"
    end

    def method_2
      # aupwe method does not exist
      super
    end
  end
end