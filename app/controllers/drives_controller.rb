class DrivesController < ApplicationController
  before_action :set_drive ,only: ["edit", "update", "destroy", "show"]
  before_filter :is_admin?
  
  def index
    @drives = Drive.all
  end
  
  def new
    @drive = Drive.new
  end
  
  def show
    
  end
  
  def create
    @drive = Drive.new(drive_params)
    @drive.status = "Registered"
    if @drive.save
      redirect_to @drive
      flash[:notice]= "Your Drive Has Been Created."
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @drive.update_attributes(drive_params)
      redirect_to drives_path
      flash[:notice]= "Your Drive Has Been Updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @drive.destroy
    redirect_to drives_path
    flash[:notice]= "Drive was successfully deleted."
  end
  
  private
  
  def drive_params
    params.require(:drive).permit(:drive_type,:status,:name,:organization,:npo_name,:drive_url,:description,:goods_type,:start_date,:end_date,:goal,:goal_unit_id,:updated_by,:logo,:on_behalfof,:image)
  end
  
  def set_drive
    @drive = Drive.find(params[:id])
  end
end
