class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
  end
  #instance variable shared across models

  def show
    @product = Product.find(params[:id])  #:id beacause this is what is used in our url
  end
end
