class CommentsSubmissionController < ApplicationController
    def new
        @comment = Comment.new
    end
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @submission.save
            flash[:success] = "The comment was successfully submitted."
            redirect_to assignment_path(@submission.assignment)
        else 
            flash[:success] = "The comment was not submitted correctly, please try again."
            redirect_back(fallback_location: root_path)
    
        end
    end
    
    
    private
    
    def submission_params
        params.require(:comment).permit(:user_id, :submission_id, :commentText)
    end
end
