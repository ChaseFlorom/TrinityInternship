

class SubmissionsController < ApplicationController
    def new
        @submission = Submission.new
    end
    def create
        @submission = Submission.new(submission_params)
        @submission.user_id = current_user.id
        @submission.ontime =  !@submission.assignment.duedate.past?
        if @submission.save
            @teachers = User.where(role: "teacher")
            @link = "https://www.trinityinternship.org/assignments/" + @submission.assignment.id.to_s
            @teachers.each do |teacher|
                AssignmentMailer.comment_email(teacher, current_user, @link).deliver
            end
            flash[:success] = "The submission was successfully submitted."
            redirect_to assignment_path(@submission.assignment)
        else 
            flash[:success] = "Submission was not submitted correctly, please try again."
            redirect_back(fallback_location: root_path)
    
        end
    end
    
    def edit
    @submission = Submission.find(params[:id])
    @assignment = @submission.assignment
    require_current(@submission)
    #require_current(@comment)
    end
    
    def update
         @submission = Submission.find(params[:id])
         @assignment = @submission.assignment
        if @submission.update(update_params)
            flash.now[:success] = "The Submission has Successfully been Saved."
            redirect_to(assignment_path(@assignment))
        else
            flash.now[:success] = "That didn't work, try again later."
            redirect_to(assignment_path(@assignment))
        end        
    end
    
    def show
        @show = Submission.find(params[:id])
    end
    def destroy
        @submission = Submission.find(params[:id])
        @submission.destroy
        flash[:danger] = "You have deleted that submission."
        redirect_back(fallback_location: root_path)
                
    end    
    
    private
    
    def if_comment_owner(submission)
       if(submission.user_id == current_user.id)
            return true
        else
            return false
       end
    end
    
    def require_current(submission)
        if submission.user_id == current_user.id|| current_user.admin == true
        
        else    
            redirect_to assignment_path(@assignment)
            flash[:danger] = "You do not have the required permissions to do that."
        end
    end

    def submission_params
        params.require(:submission).permit(:user_id, :assignment_id, :content, :ontime, :points)
    end
    
    def update_params
        params.require(:submission).permit(:content, :points)
    end

end
