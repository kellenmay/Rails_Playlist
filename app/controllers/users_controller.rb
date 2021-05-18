class UsersController < ApplicationController
  include ApplicationHelper
  before_action :find_user
  before_action :redirect_if_not_current_user, only: [:edit, :update, :destroy]

  def index 
      @users = User.all
  end 
  
  def new 
    if !current_user
        @user = User.new
    else 
        redirect_to root_path
    end 
end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
          render :new
      end 
  end 

  def show
  end

  def edit 
    
  end 

  def update 
    
      if @user.update(user_params)
          redirect_to user_path(@user)
      else 
          render :edit
      end 
  end 

  def profile
    redirect_to user_path(current_user)
  end

  def destroy 
      @user.destroy 
      redirect_to login_path
  end 

private 

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
  end 

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def redirect_if_not_current_user
    if @user.id != current_user.id
        redirect_to user_path(@user)
    end
  end


end 