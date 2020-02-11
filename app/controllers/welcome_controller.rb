class WelcomeController < ApplicationController
  def index
    @announcement = Announcement.new
    @announcements = Announcement.all
  end
end
