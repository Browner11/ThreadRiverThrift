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
    @category = params[:category]
   # if @category
   #   @products = Product.where('name LIKE ? AND categories_id = ?', "%#{@query}%", "#{@category}".to_i)
   # else
      @products = Product.where('name LIKE ?', "%#{@query}%")
   #ex end
  end

  # @products = Product.joins(:categories).where('products.name LIKE ? and categories.id LIKE ?', "%#{@query}%", "#{@category}")
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
