class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def search
    @parameter = params[:search].downcase
    @results = Garage.all.where("lower(name) LIKE :search", search: @parameter)
  end
end

#   def home
#     index
#   end

#   def index
#     @garages = Garage.search(params[:search])
#     @list
#   end
