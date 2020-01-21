class AssignmentsController < ApplicationController
    before_action :require_teacher, except: [:show, :index]
    protect_from_forgery except: :new


    def new
          @assignment =  Assignment.new
          if params[:unit_ids]
              puts "fired"
            @assignment.unit_ids = params[:unit_ids]
            @assignment.name = params[:name]
          end

    end
    
    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.duedate
            @assignment.duedate = @assignment.duedate.change({ hour: 23, min: 59, sec: 59 })
        end
        if @assignment.save
            flash[:success] = "The unit was successfully submitted."
            redirect_to unit_path(@assignment.units.ids)
        else 
            render 'new'
        end        
    end
    
    def show
        @assignment = Assignment.find(params[:id])
        @submission = Submission.new
        @submissions = @assignment.submissions 
    end
    
    def destroy
        @assignment = Assignment.find(params[:id])
        @assignment.destroy
        flash[:danger] = "You have deleted that assignment."
        redirect_back(fallback_location: root_path)
                
    end
    
    private
    
    def assignment_params
        params.require(:assignment).permit(:name, :totalpoints, :description, :link, :assignment_type, :duedate, unit_ids: [])
    end
    
    def require_teacher
        if current_user.role == "teacher" || current_user.admin == true
        
        else    
            redirect_to units_path
            flash[:danger] = "You do not have the required permissions to do that."
        end
    end
end
