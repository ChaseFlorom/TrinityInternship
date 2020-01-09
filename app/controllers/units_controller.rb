class UnitsController < ApplicationController
    before_action :require_teacher, except: [:show, :index]

    def new
        @unit = Unit.new
    end
    
    def create
        @unit = Unit.new(unit_params)
        @unit.save
        if @unit.save
            flash[:success] = "The unit was successfully submitted."
            redirect_to units_path
        else 
            render 'new'
        end
    end
    
    def show
        @unit = Unit.find(params[:id])
        @assignments = @unit.assignments

    end
    
    def index
       @units = Unit.paginate(page: params[:page], per_page: 9)
    end
    
    def destroy
        @unit = Unit.find(params[:id])
        @unit.destroy
        flash[:danger] = "You have deleted that unit."
        redirect_to units_path
    end
    
    private
    
    def unit_params
        params.require(:unit).permit(:name, :description)
    end
    
    def require_teacher
        if current_user.role == "teacher" || current_user.admin == true
        
        else    
            redirect_to units_path
            flash[:danger] = "You do not have the required permissions to do that."
        end
    end

end