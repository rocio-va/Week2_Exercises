class Blog
    attr_reader :posts
    def initialize(posts = [])
        @posts = posts
    end
    def add_post(post)
        @posts.push(post)
    end
    def latest_posts
        @posts.sort do |post1, post2|
            post1.date <=> post2.date
        end
    end

end