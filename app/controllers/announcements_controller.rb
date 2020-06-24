class AnnouncementsController < ApplicationController
    protect_from_forgery except: :new

  def index
    @announcements = Announcement.all
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
        User.all.each do |user|
          AssignmentMailer.announcement_email(user).deliver
        end
        redirect_back(fallback_location: root_path)
    else 
        flash[:success] = "Announcement was not submitted correctly, please try again."
        redirect_back(fallback_location: root_path)
  
    end    
  end
  
  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    flash[:danger] = "You have deleted that announcement."
    redirect_to announcements_path    
  end
  
    
  private
  
  def announcement_params
      params.require(:announcement).permit(:user_id, :content)
  end
    
end
