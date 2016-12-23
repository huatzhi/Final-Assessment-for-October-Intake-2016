class UsersController < ApplicationController
  before_action :authorize, only: [:upgrade_page, :upgrade]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, success: "Thanks you for signing up! "
      session[:user_id] = @user.id
    else
      render "new"
    end
  end

  def upgrade_page
    redirect_to root_path if current_user.type.present?
    @client_token = Braintree::ClientToken.generate
  end

  def upgrade
    redirect_to root_path if current_user.type.present?
    nonce_from_the_client = params[:payment_method_nonce]
 
    result = Braintree::Transaction.sale(
      :amount => 39.99,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )
    if result.success?
      current_user.type = 'ProUser'
      current_user.save!
      redirect_to root_path, notice:'Thanks for being a ProUser!'
    else
      redirect_to root_path, notice:'Please try again.'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
