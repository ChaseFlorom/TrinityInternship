class SubmissionsController < ApplicationController
    def new
        @submission = Submission.new
    end
    def create
        @submission = Submission.new
        @submission.user_id = current_user
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

end
