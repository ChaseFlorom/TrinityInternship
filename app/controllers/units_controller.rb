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
    
    
    def edit
        @unit = Unit.find(params[:id])
    end
    
    def update
        @unit = Unit.find(params[:id])
        if @unit.update(unit_params)
            flash[:success] = "The unit was successfully updated."
            redirect_to unit_path(@unit)
        else
            render 'edit'
        end        
    end
    
    private
    
    def unit_params
        params.require(:unit).permit(:name, :description, user_ids: [])
    end
    
    def require_teacher
        if current_user.role == "teacher" || current_user.admin == true
        
        else    
            redirect_to units_path
            flash[:danger] = "You do not have the required permissions to do that."
        end
    end

end