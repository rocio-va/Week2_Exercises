require './lib/blog'
#require 'rspec'

describe "test_blog" do
    describe Blog do
        before :all do
            @blog = Blog.new
        end
        it "should return an array" do
            expect(@blog.posts.class).to eq(Array)
        end
    end
end