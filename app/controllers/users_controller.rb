class UsersController < ApplicationController
    def index
       @users = User.where(role: "student").paginate(page: params[:page], per_page: 10)
    end
    
    def show
        @user = User.find(params[:id])
        @user_assignments = @user.assignments
    end

    def destroy
        puts "DESTROYED ********************************************************************************************************************************************************************"
        @user = User.find(params[:id])
        @comments = CommentsSubmission.where(user: @user)
        @comments.destroy_all
        @user.destroy
        flash[:danger] = "The user has been deleted."
        redirect_to(welcome_index_path)
                
    end    
end
