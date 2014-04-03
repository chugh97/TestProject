module DSL
  class TaskManager
    def initialize(user)
      @user = user
      @tasks = []
    end

    def get_tasks_performed
      task_text = @tasks.join(", ")
      puts "#{@user} has performed these tasks : #{task_text} "
    end

    def add_task(task)
      @tasks << task
    end
  end
end

# DSL in Ruby
def do_something(user, &block)
  task_manager = DSL::TaskManager.new(user)
  task_manager.instance_eval &block
  task_manager.get_tasks_performed
end


# implementing a DSL
do_something 'chughs' do
  add_task 'get up and make breakfast'
  add_task 'go to work'
end