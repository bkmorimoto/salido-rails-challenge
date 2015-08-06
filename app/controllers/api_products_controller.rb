class ApiProductsController < ApplicationController

  def show
    @results = Product.search(params[:search])
    render json: @results
  end

  def update
    @result = Product.update(params[:product_id], params)
    render json: @result
  end

end
