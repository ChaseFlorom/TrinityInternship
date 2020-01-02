class UnitsController < ApplicationController
    
    def new
        @unit = Unit.new
    end
    
    def create
        @unit = Unit.new(unit_params)
        @unit.save
        if @unit.save
            flash[:success] = "The unit was successfully submitted."
            redirect_to root_path
        else 
            render 'new'
        end
    end
    
    def show
       @units = Unit.all 
    end
    
    def index
        
    end
    
    
    private
    
    def unit_params
        params.require(:unit).permit(:name)
    end

end