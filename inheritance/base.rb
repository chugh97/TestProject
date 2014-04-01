module Inheritance
  class Base
    def initialize(options)
      puts "base class initilaize called"
    end

    def base_method
      puts" base method called"
    end
  end
end

require '../inheritance/sub_class_a'
r = Inheritance::Base.new(nil)
r.base_method

sub_class = Inheritance::SubClassA.new(nil)
sub_class.base_method(nil)


