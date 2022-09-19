require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  describe 'When I visit a dish show page' do
    it 'I see the dish’s name and description' do
      @tom = Chef.create!(name: "Tom")

      @toast = @tom.dishes.create!(name: "toast", description: "avacado toast")
    
      @bread = Ingredient.create!(name: "bread", calories: 100)
      @avacado = Ingredient.create!(name: "avacado", calories: 50)

      DishIngredient.create!(dish_id: @toast.id, ingredient_id: @bread.id)
      DishIngredient.create!(dish_id: @toast.id, ingredient_id: @avacado.id)

      visit "dishes/#{@toast.id}"

      expect(page).to have_content("Name: toast")
      expect(page).to have_content("Description: avacado toast")
      
      expect(page).to have_content("bread")
      expect(page).to have_content("avacado")
      expect(page).to have_content("Chef Tom")
    end
  end
end