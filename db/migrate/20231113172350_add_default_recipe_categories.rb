class AddDefaultRecipeCategories < ActiveRecord::Migration[7.1]
  def up
    ['Apéritif', 'Entrée', 'Plat', 'Dessert', 'Boisson', 'Petit-déj/brunch'].each do |name|
      RecipeCategory.create!(name: name)
    end
  end
end
