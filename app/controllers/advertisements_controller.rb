class AdvertisementsController < ApplicationController
  def show
    @advertisement = Advertisement.find(params[:id])
  
  end

  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    
    if @advertisement.save
    
      flash[:notice] = "Advertisement saved successfully"
      redirect_to @advertisement
    else
      flash.now[:alert] = "There's an error in creative an advertisement. Please try again."
      render :new
    end
  end
  
  def advertisement_params
    params.permit(:title, :body, :price)
  end
  
end
