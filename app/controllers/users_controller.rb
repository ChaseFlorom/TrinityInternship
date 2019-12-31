class UsersController < ApplicationController
    def index
       @users = User.where(role: "student").paginate(page: params[:page], per_page: 5)
    end
    
    def show
        
    end
end
