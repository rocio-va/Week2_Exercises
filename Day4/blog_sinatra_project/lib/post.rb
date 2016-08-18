class Post
    attr_reader :title, :text, :date, :author, :category
    def initialize(title, text, author, category, date = Time.now)
        @title = title
        @text = text
        @author = author
        @category = category
        @date = date
    end
end