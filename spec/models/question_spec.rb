require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "Title", body: "question body", resolved: false) }
  
  describe "attributes" do
    it "has body attributes" do
      expect(question).to have_attributes(title: "Title", body: "question body")
    end
  end
end
