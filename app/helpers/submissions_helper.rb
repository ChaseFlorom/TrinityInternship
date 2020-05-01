module SubmissionsHelper
  def is_teacher?
    if(current_user.role == "teacher") 
      return true
    else
      return false
    end
  end
end
