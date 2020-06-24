class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create_request]

    def show_demands
        @user = User.find(params[:id])
        if current_user.type_of_user != 'Hospital'
          @user = current_user
          redirect_to '/static_pages/about'
        end
        @demands = @user.demanded
    end

    def request_hospital
       @user = current_user
        if current_user.type_of_user == 'Hospital'
          redirect_to '/static_pages/about'
        else
          render 'users/new_request'
        end
    end

    def create_request
        if current_user.type_of_user == 'Hospital'
          @user = current_user
          redirect_to '/static_pages/about'
        else
        
        @user = current_user
        insert_query = <<-SQL
        INSERT INTO requests (user_id, hospital_name, created_at, updated_at)
        VALUES ('#{@user.id}', '#{params['hospital_name']}', '#{Date.current.to_s}', '#{Date.current.to_s}')
      SQL
      result = ActiveRecord::Base.connection.execute(insert_query)

  
      redirect_to '/static_pages/about'
       end
    end

    def request_list 
      if current_user.type_of_user != 'Administrador'
        @user = current_user
        render '/static_pages/about'
      else
      query = <<-SQL 
      SELECT u.id, u.first_name, u.last_name, u.email, r.hospital_name
      FROM users u, requests r
      WHERE u.id = r.user_id
      SQL
      @result = ActiveRecord::Base.connection.execute(query).to_a
      @user = current_user
      render 'users/hospital_requests'
      end
    end

    def accept_request
      if current_user.type_of_user != 'Administrador'
        redirect_to '/static_pages/about'
      else
       @user = User.find(params[:id])
       @user.type_of_user = "Hospital"
       @user.save
       query = <<-SQL
       DELETE FROM requests
       WHERE user_id = '#{params[:id]}' 
       SQL
       ActiveRecord::Base.connection.execute(query)
       redirect_to '/static_pages/about'
      end
    end
end
