class UsersController < ApplicationController

  before_filter :load_user, :only => [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to products_url, :notice => "Signed up!"
    else
      render :new
      #render "new"?
    end 
  end

  def edit
  end

  def update
 
   if @user.update_attributes(params[:user])
      redirect_to products_url, notice: "Profile updated!"
   else
      render :edit  
    end
  end

private 

def load_user
   @user = User.find(params[:id])
  
end

end
