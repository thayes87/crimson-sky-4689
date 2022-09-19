require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe "relationships" do
    it { should belong_to(:chef)}
    it { should have_many(:ingredients)}
  end

  describe '#total_calories' do
    it 'returns the sum calories for a given dish' do
      @tom = Chef.create!(name: "Tom")

      @toast = @tom.dishes.create!(name: "toast", description: "avacado toast")
    
      @bread = Ingredient.create!(name: "bread", calories: 100)
      @avacado = Ingredient.create!(name: "avacado", calories: 50)

      DishIngredient.create!(dish_id: @toast.id, ingredient_id: @bread.id)
      DishIngredient.create!(dish_id: @toast.id, ingredient_id: @avacado.id)

      expect(@toast.total_calories).to eq(150)
    end
  end
end