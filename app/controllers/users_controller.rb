class UsersController < ApplicationController
  before_filter :is_admin?
   
  def index
    @users = User.all
  end
end
