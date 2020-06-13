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
    
    def edit
        @comment = CommentsSubmission.find(params[:id])
        require_current(@comment)

    end
    
    def update
        
        @comment = CommentsSubmission.find(params[:id])
        @submission = @comment.submission
        @assignment = @submission.assignment
        if(if_comment_owner(@comment))
            if @comment.update(creation_params)
                flash[:success] = "The comment was successfully updated."
                redirect_to assignment_path(@assignment)
            else
                render 'edit'
            end  
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
    
    def if_comment_owner(comment)
       if(comment.user_id == current_user.id)
            return true
        else
            return false
       end
    end
    
    def creation_params
        params.require(:comments_submission).permit!
    end
    def require_current(comment)
        if comment.user_id == current_user.id|| current_user.admin == true
        
        else    
            redirect_to units_path
            flash[:danger] = "You do not have the required permissions to do that."
        end
    end
end
