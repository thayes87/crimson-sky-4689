class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :dishes
end