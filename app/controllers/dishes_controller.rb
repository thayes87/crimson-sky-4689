class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @total_calories = @dish.total_calories
  end
end