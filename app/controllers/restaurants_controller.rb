class RestaurantsController < ApplicationController
  def index         # GET /restaurants
    @restaurants = Restaurant.all
  end

  def show          # GET /restaurants/:id
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews

    sum = 0
    @reviews.each do |review|
      sum += review.rating
    end
    @average = (sum.to_f / @reviews.count).round(2)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create        # POST /restaurants
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end