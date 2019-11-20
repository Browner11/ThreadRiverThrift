# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  has_one_attached :image
  paginates_per 9

  def fullsize
    image.variant(resize: '900x900!')
  end

  def medium
    image.variant(resize: '600x600!')
  end
end
