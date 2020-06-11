

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
                AssignmentMailer.submission_email(teacher, current_user, @link).deliver
            end
            flash[:success] = "The submission was successfully submitted."
            redirect_to assignment_path(@submission.assignment)
        else 
            flash[:success] = "Submission was not submitted correctly, please try again."
            redirect_back(fallback_location: root_path)
    
        end
    end
    
    def update
         @submission = Submission.find(params[:id])
        if @submission.update(submission_params)
            flash.now[:success] = "The Grade has Successfully been Saved."
            redirect_back(fallback_location: root_path)
        else
            flash.now[:danger] = "That didn't work, try again later."
            redirect_back(fallback_location: root_path)
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
    
    def submission_params
        params.require(:submission).permit(:user_id, :assignment_id, :content, :ontime, :points)
    end

end
