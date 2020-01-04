class AssignmentsController < ApplicationController
    def new
          @assignment =  Assignment.new
          if params[:unit_ids]
              puts "fired"
            @assignment.unit_ids = params[:unit_ids]
          end
    end
    
    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.save
            flash[:success] = "The unit was successfully submitted."
            redirect_to unit_path(@assignment.units.ids)
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
