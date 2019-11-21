class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @garage = Garage.find(params[:garage_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @garage = Garage.find(params[:garage_id])
    @review.user = current_user
    @review.garage = @garage
    if @review.save
      redirect_to garage_path(@garage)
    else
      render :new
    end
  end

  def destroy
    authorize(@review)
    @review = Review.find(params[:id])
    @review.delete
    redirect_to garage_path
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
