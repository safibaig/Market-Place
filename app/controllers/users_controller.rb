class UsersController < ApplicationController
  def index
    @users = User.all
    @title = "All users"
  end
  
  def show
    @user = User.find(params[:id])
    @title = "Profile"
  end
  
  def new
    @user = User.new
    @title = "New user"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Editing user"
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end
