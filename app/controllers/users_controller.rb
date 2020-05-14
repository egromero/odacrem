class UsersController < ApplicationController

    def show_demands
        @user = User.find(params[:id])
        @demands = @user.demanded
    end
end
