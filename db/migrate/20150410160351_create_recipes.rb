class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.text :directions
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipes, :users
  end
end
