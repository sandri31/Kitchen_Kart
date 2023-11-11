# frozen_string_literal: true

categories = ['Apéritifs', 'Entrées', 'Plats', 'Desserts', 'Boissons', 'Petit-déj/brunch']
categories.each do |category_name|
  RecipeCategory.find_or_create_by(name: category_name)
end

# 1. Use the find_or_create_by method to create a User with the email
user = User.find_or_create_by(email: 'user@example.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
  u.username = 'chef_user'
end

# 2. Category of recipe
category = RecipeCategory.find_or_create_by(name: 'Desserts')

# 3. Category of ingredient
chocolate_category = IngredientCategory.find_or_create_by(name: 'Chocolat')
fruit_category = IngredientCategory.find_or_create_by(name: 'Fruits')
dairy_category = IngredientCategory.find_or_create_by(name: 'Produits laitiers')

# 4. Ingredient of recipe
chocolate = Ingredient.find_or_create_by!(name: 'Tablette de chocolat', ingredient_category: chocolate_category)
dough = Ingredient.find_or_create_by!(name: 'Pâte sablée', ingredient_category: dairy_category)
apples = Ingredient.find_or_create_by!(name: 'Pommes', ingredient_category: fruit_category)
eggs = Ingredient.find_or_create_by!(name: 'Oeufs', ingredient_category: dairy_category)
cream = Ingredient.find_or_create_by!(name: 'Crème liquide', ingredient_category: dairy_category)

# 5. Ustensil
whisk = Utensil.find_or_create_by(name: 'Fouet')

# 6. Recipe
recipe = user.recipes.find_or_create_by(title: 'Tarte aux pommes et chocolat Nestlé Dessert') do |r|
  r.recipe_category = category
  r.cooking_time = 10
  r.preparation_time = 40
  r.total_time = 50
  r.difficulty = 'Facile'
  r.cost = 'Bon marché'
  r.servings = 10
  r.description = 'Une délicieuse tarte aux pommes avec une touche de chocolat Nestlé Dessert.'
end

# 7. Add ingredients to recipe
RecipeIngredient.transaction do
  recipe.recipe_ingredients.create!([
                                      { ingredient: chocolate, quantity: 1, unit: 'tablette' },
                                      { ingredient: dough, quantity: 1, unit: 'unité' },
                                      { ingredient: apples, quantity: 2, unit: 'unité' },
                                      { ingredient: eggs, quantity: 2, unit: 'unité' },
                                      { ingredient: cream, quantity: 200, unit: 'ml' }
                                    ])
end

# 8. Add utensils to recipe
recipe.recipe_utensils.find_or_create_by(utensil: whisk)

# 9. Add steps to recipe
recipe.recipe_steps.find_or_create_by(step_number: 1) do |rs|
  rs.instructions = 'Pelez et coupez les pommes en fins quartiers.'
end
recipe.recipe_steps.find_or_create_by(step_number: 2) do |rs|
  rs.instructions = 'Faites chauffer la crème et versez sur le chocolat cassé en morceaux. Mélangez. Ajoutez les oeufs.'
end
recipe.recipe_steps.find_or_create_by(step_number: 3) do |rs|
  rs.instructions = 'Déroulez la pâte dans un moule à tarte (24cm de diamètre). Ajoutez la préparation au chocolat et répartissez les pommes dessus.'
end
recipe.recipe_steps.find_or_create_by(step_number: 4) do |rs|
  rs.instructions = 'Faites cuire en bas de four 25 minutes en mode traditionnel à 200°C.'
end
