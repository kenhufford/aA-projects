class SessionsController < ApplicationController
  before_action :deny_current_user!, except: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user
      login!(user)
      redirect_to cats_url
    
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end
