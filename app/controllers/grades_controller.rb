class GradesController < ApplicationController
  def index
    @users = User.where(role: "student").paginate(page: params[:page], per_page: 50)
  end
end
