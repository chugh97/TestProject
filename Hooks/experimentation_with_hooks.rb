require '../Hooks/module_a'
module Hooks
  class ExperimentationWithHooks
    include Hooks::ModuleA
    def initialize

    end


  end
end

Hooks::ExperimentationWithHooks.class_method_a

Hooks::ExperimentationWithHooks.new.instance_method_a