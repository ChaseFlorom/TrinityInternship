class SubmissionsController < ApplicationController
    def new
        @submission = Submission.new
    end
    def create
        @submission = Submission.new(submission_params)
        @submission.user_id = current_user.id
        if @submission.save
            flash[:success] = "The submission was successfully submitted."
            redirect_to assignment_path(@submission.assignment)
        else 
            flash[:success] = "Submission was not submitted correctly, please try again."
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
        params.require(:submission).permit(:user_id, :assignment_id, :content)
    end

end
