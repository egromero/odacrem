class DonationsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @fabs = User.where(type_of_user: "Fabricante")
    end

    def donate
        @fab = User.find(params[:fab_id])
        @fab_id = params[:fab_id]
    end

    def process_donations
        donation = params[:donation]
        if donation == 'other'
            donation = params[:donationvalue]
        end
        fab = User.find(params[:fab_id])
        fab.fab_donations += donation.to_i
        fab.save
        respond_to do |f|
            f.html {redirect_to '/donations', notice: "Hemos recibido su donación, Muchas gracias <3 !"}
        end
    end
end
