class AnnouncementsController < ApplicationController
    protect_from_forgery except: :new

  def index
    
  end
  
  def new
    @announcement = Announcement.new
  end
  
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user_id = current_user.id
    @announcement.save
    if @announcement.save
        flash[:success] = "The announcement was successfully submitted."
        redirect_back(fallback_location: root_path)
    else 
        flash[:success] = "Announcement was not submitted correctly, please try again."
        redirect_back(fallback_location: root_path)
  
    end    
  end
  
  def destroy
    
  end
  
    
  private
  
  def announcement_params
      params.require(:announcement).permit(:user_id, :content)
  end
    
end
