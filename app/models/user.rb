class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :allocations, dependent: :destroy # si borro user se borran sus alloc
  has_many :demands, through: :allocations # cuando aporta
end
