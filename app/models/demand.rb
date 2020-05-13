class Demand < ApplicationRecord
  belongs_to :product # no hago depend de delete
  has_many :allocations, dependent: :destroy # si borro demand se borran sus alloc
  has_many :users, through: :allocations # los que aportan
end
