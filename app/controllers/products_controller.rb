class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
  end
  #instance variable shared across models

  def show
  end
end
