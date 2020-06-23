class Product < ApplicationRecord
  has_many :demand
  has_one_attached :image
end
