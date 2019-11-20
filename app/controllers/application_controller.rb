class ApplicationController < ActionController::Base
  before_action :set_categories

  private

  def set_categories
    @cats = Category.all
  end
end
