class UserController < ApplicationController
    
    def index
       @users = User.paginate(page: params[:page], per_page: 5)
    end
    
    def show
        
    end
end
