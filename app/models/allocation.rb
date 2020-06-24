class Allocation < ApplicationRecord
  belongs_to :demand
  belongs_to :user

  def expired
    return self.promised_at < Date.today
  end

  def get_text_from_status
    begin
      status_map = {0 => 'Comprometida', 1 => 'Entregada', 2 => 'Cancelada'}
      status_map[self.status]
    rescue
      'Sin informacion'
    end
  end

end
