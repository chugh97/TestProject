module Procs
  class ClassB
    def initialize

    end

    def execute_method_handling_two_scenarios(*arr)
      return yield if block_given?
      total = 0
      arr.each { |a| total += a }
      total
    end
  end
end

x = Procs::ClassB.new

result = x.execute_method_handling_two_scenarios do
  a = 10
  b = 20
  a + b
end

puts result

result = x.execute_method_handling_two_scenarios(1,2,3,4,5)
puts result