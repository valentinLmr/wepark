class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home



def search
  if params[:search].blank?
    redirect_to(root_path, alert: "Empty field!") and return
  else
    @parameter = params[:search].downcase
    @results = Garage.all.where("lower(name) LIKE :search", search: @parameter)
end










#   def home
#     index
#   end

#   def index
#     @garages = Garage.search(params[:search])
#     @list
#   end
# end
