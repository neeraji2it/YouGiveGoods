class ProductsController < ApplicationController
  before_action :set_products ,only: ["edit", "update", "destroy"]
   before_filter :is_admin?
   
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
      flash[:notice]= "Product was successfully created."
    else
      render :action => "new"
    end
  end
  
  def edit
    
  end
  
  def update
    if @product.update_attributes(product_params)
      redirect_to products_path
      flash[:notice]= "Product was successfully updated."
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = "Product was successfully deleted."
  end
  
  private
  
  def set_products
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:product_type,:status,:name,:description,:base_unit,:product_attributes,:image_url,:categories,:cost,:pounds,:updated_by)
  end
end
