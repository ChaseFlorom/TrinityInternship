class CommentsSubmissionsController < ApplicationController
    def new
        @comment = CommentsSubmission.new
    end
    def create
        @comment = CommentsSubmission.new(creation_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "The comment was successfully submitted."
            redirect_to assignment_path(root_path)
        else 
            flash[:success] = "The comment was not submitted correctly, please try again."
            redirect_back(fallback_location: root_path)
    
        end
    end
    
    
    private
    
    def creation_params
        params.permit(:comment)
    end
end
