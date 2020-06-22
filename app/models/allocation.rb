class Allocation < ApplicationRecord
  belongs_to :demand
  belongs_to :user
  def expired
    return self.promised_at < Date.today
  end

end
