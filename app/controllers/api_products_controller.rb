class ApiProductsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def search
    @results = Product.search(params[:search])
    render json: @results
  end

  def update
    @result = Product.update(params[:id], params)
    render json: @result
  end

end
