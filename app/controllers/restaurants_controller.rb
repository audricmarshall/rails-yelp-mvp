class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show] # DRY si jamais besoin de rajouter edit destroy update ...

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
    # @restaurant est déjà défini par before_action
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
