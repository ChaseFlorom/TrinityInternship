class WelcomeController < ApplicationController
  def index
    @announcement = Announcement.new
  end
end
