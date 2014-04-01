require '../Modules/module_a'
require '../Modules/module_b'
require '../Modules/module_c'
module Modules
  class ClassWhereModuleIsIncluded
    include Modules::ModuleA

    def initialize

    end

    def call_a_module_method
      method_in_module_a
    end
  end
end

module Modules
  class ClassWhereModuleIsIncluded2
    include Modules::ModuleC
    include Modules::ModuleB
    include Modules::ModuleA

    def initialize

    end

    def call_a_module_method
      method_in_module_a
    end
  end
end

x = Modules::ClassWhereModuleIsIncluded.new
x.call_a_module_method
x.method_in_module_a
puts "====================="
x = Modules::ClassWhereModuleIsIncluded2.new
x.method_in_module_a

puts x.class.ancestors