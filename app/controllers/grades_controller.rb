class GradesController < ApplicationController
      before_action :require_teacher

  def index
    @users = User.where(role: "student").paginate(page: params[:page], per_page: 50)
  end
  
  
  private
    

  def require_teacher
      if current_user.role == "teacher" || current_user.admin == true
      
      else    
          flash[:danger] = "You do not have the required permissions to do that."
          redirect_to root_path
      end
  end
end
