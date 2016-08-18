require './lib/post'
#require 'rspec'

describe "test_post" do
    describe Post do
        before :all do
            @post = Post.new("titulo de mi post", "text", "rocio", "category")
        end
        it "should return the title" do
            expect(@post.title).to eq("titulo de mi post")
        end
        it "text should be a string" do
            expect(@post.text.instance_of?(String)).to be_truthy
        end
        it "should return the author" do
            expect(@post.author).to eq("rocio")
        end
    end
end