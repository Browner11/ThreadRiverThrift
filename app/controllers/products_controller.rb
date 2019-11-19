class ProductsController < ApplicationController
  # before_action :load_cart


  def index
    @products = Product.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    @query = params[:query]
    @products = Product.where('name LIKE ?', "%#{@query}%")
  end

  # def add_to_cart
  #   id = params[:id].to_i
  #   session[:cart] << id unless session[:cart].include?(id)
  #   redirect_to root_path
  # end

  # def delete_from_cart
  #   id = params[:id].to_i
  #   session[:cart].delete(id)
  #   redirect_to root_path
  # end

  # private

  # def load_cart
  #   @cart = Product.find(session[:cart])
  # end
end
