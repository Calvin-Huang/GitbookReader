class UsersController < ApplicationController
  before_action :authenticate_user!

  def stars
    render json: { current_user: current_user }
  end
end