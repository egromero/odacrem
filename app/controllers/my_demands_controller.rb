class MyDemandsController < ApplicationController
  def mydemand
    @current_user_demands = current_user.demanded
  end

  def myhelp
    @allocations_with_demands = []
    @current_user_allocations = current_user.allocations
    @current_user_allocations.each do |alloc| ## el loop agrega la informacion de la productora
        demand = Demand.where(:id => alloc.demand_id).first()
        @allocations_with_demands << [alloc, demand]
      end
  end
end
