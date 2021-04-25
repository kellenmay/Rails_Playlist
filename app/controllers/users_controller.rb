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
      @user = User.find_by_id(params[:id])
  end 

  def edit 
      @user = User.find_by_id(params[:id])
  end 

  def update 
      @user = User.find_by_id(params[:id])
      if @user.update(user_params)
          redirect_to user_path(@user)
      else 
          render :edit
      end 
  end 

  def destroy 
      @user = User.find_by_id(params[:id])
      @user.destroy 
      redirect_to users_path
  end 

private 

  def user_params
      params.require(:user).permit(:name)
  end 

end