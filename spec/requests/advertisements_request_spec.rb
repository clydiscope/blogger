require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_advertisement) {Advertisement.create!(title: "Product", body: "Buy this!", price: 1)}


  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, params: {id: my_advertisement.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_advertisement to @advertisement" do
      get :show, params: {id: my_advertisement.id}
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
    
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns my advertisement to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiated @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "Advertisement create" do
    
    it "increases the number of advertisements by 1" do
      expect{post :create, params: {title: "Products", body: "Buy this", price: 1}}.to change(Advertisement,:count).by(1)
    end
    
    it "redirects to the new advertisement" do
      post :create, params: {title: "Product", body: "Buy this!", price: 1}
      expect(response).to redirect_to Advertisement.last
    end
    
    it "redirects to the new advertisement" do
      post :create, params: {title: "Product", body: "Buy this!", price: 1}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
