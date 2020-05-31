class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @announcement = Announcement.new
    @announcements = Announcement.all
  end
end
