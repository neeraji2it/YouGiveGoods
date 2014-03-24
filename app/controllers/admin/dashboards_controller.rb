class Admin::DashboardsController < ApplicationController
 before_filter :is_admin?
 before_action :set_user, only: ["edit", "update", "destroy"]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.password = '123123123'
    @user.password_confirmation = '123123123'
    if @user.save
     @user.update_attributes(:confirmation_token => nil,:confirmed_at => Time.now)
     @user.send_reset_password_instructions
      redirect_to users_path
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to users_path
      flash[:notice] = "User was successfully updated"
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
    flash[:notice]= "User was successfully deleted."
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:user_type,:status,:first_name,:last_name,:updated_by,:reset_password_token,:reset_password_sent_at,:remember_created_at,:sign_in_count,:current_sign_in_at,:last_sign_in_at,:current_sign_in_ip,:last_sign_in_ip,:confirmation_token,:confirmed_at,:confirmation_sent_at,:unconfirmed_email)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
