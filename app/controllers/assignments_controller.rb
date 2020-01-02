class AssignmentsController < ApplicationController
    def new
        @assignment = Assignment.new
    end
    
    def create
        debugger
        @assignment = Assignment.new(assignment_params)
        @assignment.save
        if @assignment.save
            flash[:success] = "The unit was successfully submitted."
            redirect_to units_path
        else 
            render 'new'
        end        
    end
    
    def show
        
    end
    
    
    private
    
    def assignment_params
        params.require(:assignment).permit(:name, :description, :duedate, unit_ids: [])
    end
end
