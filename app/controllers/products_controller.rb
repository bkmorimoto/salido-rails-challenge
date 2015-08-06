class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      redirect_to edit_product_path(@product)
    end
  end

  def product_params
    params.require(:product).permit(:name, :url, :appellation, :product_type, :varietal, :vineyard, :review_url, :description, :price_max, :price_min, :price_retail, :highest_rating)
  end

end
