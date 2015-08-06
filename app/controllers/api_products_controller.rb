class ApiProductsController < ApplicationController

  def show
    @results = Product.search(params[:search])
  end

end
