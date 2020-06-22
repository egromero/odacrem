class Demand < ApplicationRecord
  belongs_to :product # no hago depend de delete
  belongs_to :demander, class_name: "User", foreign_key: "demander_id" # sí hago dependent delete en user
  has_many :allocations, dependent: :destroy # si borro demand se borran sus alloc
  has_many :users, through: :allocations # los que aportan

  def expired
    return self.expiry_at < Date.today
  end
end
