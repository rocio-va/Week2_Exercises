class TodoList
    attr_reader :tasks
    def initialize(user, tasks = [])
        @tasks = tasks
        @user=user
    end 
    def add_task task
        @tasks.push(task)
    end
    def delete_task id
        #@tasks.delete_if {|task| task.id == id}
        index = @tasks.find_index{|task|task.id == id}
        @tasks.delete_at(index) 
    end
    def find_task_by_id id
        index = @tasks.find_index{|task|task.id == id}
        if index == nil 
            nil
        else
            @tasks[index]
        end 
    end 
    def sort_by_created order
        if order.upcase == "ASC"
            @tasks.sort{|task1, task2| task1.created_at <=> task2.created_at }
        elsif order.upcase == "DESC"
            @tasks.sort{|task1, task2| task2.created_at <=> task1.created_at }
        else
            puts "Parametro incorrecto"
        end
    end

end