require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "Product", body: "Buy this!", price: 1)}
  
  it "has title, body, and price attributes" do
    expect(advertisement).to have_attributes(title:"Product", body:"Buy this!", price: 1)
  end
end
