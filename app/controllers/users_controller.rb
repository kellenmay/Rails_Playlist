class UsersController < ApplicationController
    
  def index 
      @users = User.all
  end 
  
  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
          redirect_to user_path(@user)
      else 
          render :new
      end 
  end 

  def show 
    find_user
  end 

  def edit 
    find_user
  end 

  def update 
    find_user
      if @user.update(user_params)
          redirect_to user_path(@user)
      else 
          render :edit
      end 
  end 

  def destroy 
    find_user
      @user.destroy 
      redirect_to users_path
  end 

private 

  def user_params
      params.require(:user).permit(:name)
  end 

  def find_user
    @user = User.find_by_id(params[:id])
  end


end