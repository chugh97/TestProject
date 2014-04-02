module Procs
  class ClassA
    def initialize

    end

    def execute_method_with_procs(proc1,proc2)
      proc1.call
      proc2.call
    end
  end
end

x = Procs::ClassA.new
proc1 = Proc.new { puts "Proc 1 called" }
proc2 = Proc.new { puts "Proc 2 called" }

x.execute_method_with_procs proc1, proc2