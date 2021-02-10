require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  let(:my_user) { User.create!(name: "Blogger User", email: "user@blogger.com", password: "fakepassword") }
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!( title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user ) }
  
  let(:comment) {Comment.create!(body: 'Comment Body', commentable: post, user: my_user)} 
    
    it { is_expected.to belong_to(:commentable) }
#    it { is_expected.to belong_to(:topic).through(:commentable) }
#    it { is_expected.to belong_to(:post).through(:commentable) }
    
    it { is_expected.to belong_to(:user) }
    
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(5) }
  
  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end
