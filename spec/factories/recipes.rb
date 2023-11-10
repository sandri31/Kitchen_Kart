# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    association :user
    association :recipe_category
    title { 'Tarte aux pommes et chocolat Nestlé Dessert' }
    cooking_time { 10 }
    preparation_time { 40 }
    difficulty { 'Facile' }
    cost { 'Bon marché' }
    servings { 10 }
    description { 'Une délicieuse tarte aux pommes avec une touche de chocolat Nestlé Dessert.' }
  end
end
