class AdsController < ApplicationController
  before_action :set_ad, only: [:show]
  before_action :authorize, only: [:new, :create]

  def index  
  end

  def new
    authorize
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build(ad_params)

    if @ad.save
      redirect_to @ad, notice: "This ad is succesfully posted!"
    else
      render 'new', notice: @ad.errors.full_messages
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  private
  def ad_params
    params.require(:ad).permit(:title, :price, :location, :condition, :contact_name, :phone_number, :email, :description)
  end

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
