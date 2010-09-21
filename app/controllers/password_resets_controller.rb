class PasswordResetsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user.reset_perishable_token!
      Notifications.forgot_password(@user).deliver
      flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."
      redirect_to root_url
    else
      @user = User.new
      flash[:notice] = "No user was found with #{params[:user][:email]} email address"
      render :action => :new
    end
  end
  
  def edit
    @user = User.find_using_perishable_token(params[:id])
  end
  
  def update
    @user = User.find_using_perishable_token(params[:id])
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to user_projects_path(@user)
    else
      render :action => :edit
    end
  end

end
  