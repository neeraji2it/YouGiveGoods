class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @drives = Drive.all
    @campaigns = Campaign.all
  end
  
end
