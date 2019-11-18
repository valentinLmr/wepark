class ProfilesController < ApplicationController
  def dashboard
    @garages = current_user.garages
    @rentals = current_user.rentals
  end
end
