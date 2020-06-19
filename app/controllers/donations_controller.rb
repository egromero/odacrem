class DonationsController < ApplicationController
    def index
        @fabs = User.where(type_of_user: "Fabricante")
    end

    def donate
        @fab = User.find(params[:fab_id])


    end

end
