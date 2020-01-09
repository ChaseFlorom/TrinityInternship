class SubmissionsController < ApplicationController
    def new
        @submission = Submission.new
    end
    def create
        @submission = Submission.new(submission_params)
        @submission.user_id = current_user
        @submission.assignment_id = @assignment.id
        if @submission.save
            flash[:success] = "The submission was successfully submitted."
            redirect_to units_path
        else 
            flash[:success] = "Submission was not submitted correctly, please try again."
            redirect_back(fallback_location: root_path)

        end
    end
    
    def show
        @show = Submission.find(params[:id])
    end
    
    
    private
    
    def submission_params
        params.require(:assignment).permit(:user_id, :assignment_id)
    end

end
