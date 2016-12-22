class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @index = Ad.all
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

  def edit
  end

  def update
    if @ad.update_attributes(ad_params)
      redirect_to @ad, notice: 'Update succeed.'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end

  def destroy
    @ad.destroy
    redirect_to ads_path, notice: 'This ad is deleted.'
  end

  private
  def ad_params
    params.require(:ad).permit(:title, :price, :location, :condition, :contact_name, :phone_number, :email, :description, {pictures: []})
  end

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def authorize_owner
    @ad = current_user.ads.find(params[:id])
    if @ad.nil?
      redirect_to ads_path, notice: 'You do not have the permission to do this action'
    end
  end
end
