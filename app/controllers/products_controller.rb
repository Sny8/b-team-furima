class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    @product.save 
  end

  def show
    
  end


  def edit
  end

  def update
  end

  def destroy
  end

  def product_params
    params.require(:product).permit(:name, :condition, images_attributes: [:url])
  end

end

