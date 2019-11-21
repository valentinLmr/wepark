class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @garages = policy_scope(Garage)
    if params[:city].present? || params[:surface].present? || params[:price].present?

      params[:surface].present? ? surface = params[:surface].to_i : surface = 0
      params[:price].present? ? price = params[:price].to_i : price = 1000

      if params[:city] == ""
        @garages = Garage.where('capacity >= ? AND price <= ?', surface, price)
      else
        @garages = Garage.where('city ILIKE ? AND capacity >= ? AND price <= ?', "%#{params[:city]}%", surface, price)
      end
    else
      @garages = Garage.all
    end
    @markers = get_markers(@garages)
  end

  def new
    @garage = Garage.new
    authorize(@garage)
  end

  def create
    @garage = Garage.new(garage_params)
    @garage.full_address = "#{@garage.location}, #{@garage.postale} #{@garage.city}"
    @garage.user = current_user
    authorize(@garage)

    if @garage.save
      redirect_to garages_path
    else
      render :new
    end
  end

  def show
    @garage = Garage.find(params[:id])
    @reviews = Review.where(garage_id: @garage.id)
    authorize(@garage)
    # @reviews.rating
  end

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    @garage = Garage.find(params[:id])
    @garage.full_address = "#{@garage.location}, #{@garage.postale} #{@garage.city}"
    if @garage.update(garage_params)
      redirect_to garage_path
    else
      render :edit
    end
  end

  def destroy
    @garage = Garage.find(params[:id])
    @garage.delete

    redirect_to dashboard_path
  end

  private

  def get_markers(garages)
    # recup garages with valid coordinates
    geocoded_garages = garages.geocoded
    geocoded_garages.map do |garage|
      {
        lat: garage.latitude,
        lng: garage.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garage: garage })
      }
    end
  end

  def garage_params
    params.require(:garage).permit(:capacity, :price, :description, :location, :photo, :search, :city, :postale)
  end


end
