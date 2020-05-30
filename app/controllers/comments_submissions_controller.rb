class CommentsSubmissionsController < ApplicationController
    def new
        @comment = CommentsSubmission.new
    end
    def create
        @comment = CommentsSubmission.new(creation_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "The comment was successfully submitted."
            redirect_back(fallback_location: root_path)
        else 
            flash[:success] = "The comment was not submitted correctly, please try again."
            redirect_back(fallback_location: root_path)
        end
    end
    
    def destroy
        @comment = CommentsSubmission.find(params[:id])
        if current_user.role == "teacher" || @comment.user_id == current_user.id
            @comment.destroy
            flash[:danger] = "You have deleted that comment."
            redirect_back(fallback_location: root_path)    
        else
            flash[:danger] = "You don't have permission to delete that."
            redirect_back(fallback_location: root_path)                
        end
  
    end
    
    private
    
    def creation_params
        params.require(:comments_submission).permit!
    end
end
