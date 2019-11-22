class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @garages = policy_scope(Garage)

    if at_least_city_or_surface_or_price_present?

      adresse    = params[:adresse].present? ? "#{params[:adresse]}, #{params[:city]}" : params[:city].to_s
      rayon      = params[:rayon].present? ? params[:rayon].to_i : 0
      surface    = params[:surface].present? ? params[:surface].to_i : 0
      price      = params[:price].present? ? params[:price].to_i : 1000
      start_date = params[:datedebut].present? ? params[:datedebut] : Date.today
      end_date   = params[:datefin].present? ? params[:datefin] : Date.today
      request_by_date = false

      selected_garages = []
      if params[:datedebut].present? && params[:datefin].present?
        @garages.each do |garage|
          if garage_is_periode_ok?(garage, start_date, end_date)
            selected_garages << garage.id
          end
        end
        request_by_date = true
      end

      if params[:city].blank?

        if request_by_date
          @garages = @garages.where('capacity >= ? AND price <= ?', surface, price).where({ id: selected_garages })
        else
          @garages = @garages.where('capacity >= ? AND price <= ?', surface, price)
        end

      elsif rayon > 0

        if request_by_date
          @garages = @garages.where('capacity >= ? AND price <= ?', surface, price).where('selected = ?', true).near(adresse, rayon).where({ id: selected_garages })
        else
          @garages = @garages.where('capacity >= ? AND price <= ?', surface, price).where('selected = ?', true).near(adresse, rayon)
        end
      elsif request_by_date
        @garages = @garages.where('city ILIKE ? AND capacity >= ? AND price <= ?', "%#{params[:city]}%", surface, price).where({ id: selected_garages })
      else
        @garages = @garages.where('city ILIKE ? AND capacity >= ? AND price <= ?', "%#{params[:city]}%", surface, price)
      end

    else
      @garages = Garage.all.order("created_at ASC")
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

  def parse_date(string_date)
    Date.parse(string_date.split('/').reverse.join("-"))
  end

  def garage_is_periode_ok?(garage, date_debut, date_fin)
    # technique pour voir toutes rentals pour tous les garages
    # code a garder
    # @garages.rentals.each do |rental|
    # end

    # rentals = Rental.where("garage_id = ?", garage_id)
    garage.rentals.each do |rental|
      # loca_debut = parse_date(garage_id_rental[:start_date])
      # loca_fin = parse_date(garage_id_rental[:end_date])

      if (rental[:start_date]..rental[:end_date]).overlaps?(parse_date(date_debut)..parse_date(date_fin))
        return false
      end
    end
    # rental_array_date = (self.start_date..self.end_date).to_a
    # sql_query = "garage_id = ? AND end_date < ? AND start_date >"
    # Rental.where(sql_query, self.id, date_fin, date_debut)
    # Rental.rental_available?(self.id, date_fin, date_debut)
    return true
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

  def at_least_city_or_surface_or_price_present?
    params[:city].present? || params[:surface].present? || params[:price].present?
  end
end
