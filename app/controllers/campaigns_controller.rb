class CampaignsController < ApplicationController
  before_action :set_campaign, only: ["edit", "update", "destroy"]
   before_filter :is_admin?
  
  def index
    @campaigns = Campaign.all
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.status = "Registered"
    if @campaign.save
      redirect_to campaigns_path
      flash[:notice] = "Campaign was successfully created."
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @campaign.update_attributes(campaign_params)
      redirect_to campaigns_path
      flash[:notice] = "Campaign was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @campaign.destroy
    redirect_to campaigns_path
    flash[:notice]= "Campaign was successfully deleted."
  end
  
  private
  def campaign_params
    params.require(:campaign).permit(:campaign_type, :status,:name,:organization,:npo_name,:campaign_url,:description,:start_date,:end_date,:goal,:goal_unit_id,:updated_by,:logo,:image)
  end
  
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
