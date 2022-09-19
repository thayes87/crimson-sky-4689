require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  describe 'When I visit a chef show page' do
    it 'I see link to view a list of all ingredients that this chef uses in their dishes' do
      @tom = Chef.create!(name: "Tom")

      @toast = @tom.dishes.create!(name: "toast", description: "avacado toast")
      @cereal = @tom.dishes.create!(name: "cereal", description: "honey nut chex")
    
      @bread = Ingredient.create!(name: "bread", calories: 100)
      @avocado = Ingredient.create!(name: "avocado", calories: 50)
      @chex = Ingredient.create!(name: "chex", calories: 10)
      @milk = Ingredient.create!(name: "milk", calories: 25)
      
      DishIngredient.create!(dish_id: @toast.id, ingredient_id: @bread.id)
      DishIngredient.create!(dish_id: @toast.id, ingredient_id: @avocado.id)
      DishIngredient.create!(dish_id: @cereal.id, ingredient_id: @chex.id)
      DishIngredient.create!(dish_id: @cereal.id, ingredient_id: @milk.id)
    
      visit chef_path(@tom)

      expect(page).to have_content("Chef Tom")
      expect(page).to have_link("All Ingredients")

      click_link("All Ingredients")

      expect(current_path).to eq(chef_ingredients_path(@tom))

      expect(page).to have_content(@bread.name)
      expect(page).to have_content(@avocado.name)
      expect(page).to have_content(@chex.name)
      expect(page).to have_content(@milk.name)
    end
  end
end

#     As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses.