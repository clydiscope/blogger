require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
	describe "GET index" do
		it "renders the index template" do
		
			get '/welcome/index' 
		
			expect(response).to render_template(:index)
		end
	end
	
	describe "GET about" do
		it "renders the about template" do
			get "/welcome/about"
			expect(response).to render_template(:about)
		end
	end
end
