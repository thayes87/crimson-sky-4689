class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :dish, foreign_key: true
      t.string :name
      t.integer :calories

      t.timestamps
    end
  end
end
