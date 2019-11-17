# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  has_one_attached :image
  paginates_per 9

  def thumbnail
    image.variant(resize: '300x300!')
  end

  def medium
    image.variant(resize: '600x600!')
  end
end
