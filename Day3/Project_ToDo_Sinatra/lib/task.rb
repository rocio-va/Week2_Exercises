class Task
    attr_reader :content, :id, :update_at, :created_at
    @@current_id = 1
    def initialize(content, time)
        @content = content
        #@id = @@current_id
        @@current_id +=1
        @id = content.hash
        @status = false
        #@created_at =Time.now
        @created_at = time
        @update_at = nil
    end
    def complete?
        @status
    end
    def complete!
        @status = true
    end
    def make_incomplete!
        @status = false
    end
    def update_content! content
        @update_at = Time.now
        @content = content
    end
end