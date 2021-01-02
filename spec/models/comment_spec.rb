require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  let(:my_user) { User.create!(name: "Blogger User", email: "user@blogger.com", password: "fakepassword") }
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!( title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user ) }
  
  let(:comment) {Comment.create!(body: 'Comment Body', post: post)} 
  
  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end
