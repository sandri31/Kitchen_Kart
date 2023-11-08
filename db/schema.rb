# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_08_211128) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
    t.index ["user_id", "recipe_id"], name: "index_comments_on_user_id_and_recipe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ingredient_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "ingredient_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_category_id"], name: "index_ingredients_on_ingredient_category_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ratings_on_recipe_id"
    t.index ["user_id", "recipe_id"], name: "index_ratings_on_user_id_and_recipe_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipe_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "quantity", null: false
    t.string "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipe_utensils", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "utensil_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_utensils_on_recipe_id"
    t.index ["utensil_id"], name: "index_recipe_utensils_on_utensil_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_category_id", null: false
    t.string "title", limit: 255, null: false
    t.integer "cooking_time"
    t.integer "preparation_time"
    t.integer "total_time"
    t.string "difficulty", default: "Facile", null: false
    t.string "cost", default: "Bon marché", null: false
    t.integer "servings", default: 1, null: false, comment: "Number of people the recipe is for"
    t.integer "status", default: 0, null: false, comment: "Status of the recipe (draft, published, archived)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_category_id"], name: "index_recipes_on_recipe_category_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "shopping_bag_items", force: :cascade do |t|
    t.bigint "shopping_bag_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "quantity"
    t.string "unit", limit: 50
    t.boolean "purchased", default: false
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_shopping_bag_items_on_ingredient_id"
    t.index ["shopping_bag_id"], name: "index_shopping_bag_items_on_shopping_bag_id"
  end

  create_table "shopping_bags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_bags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "utensils", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "recipes"
  add_foreign_key "comments", "users"
  add_foreign_key "ingredients", "ingredient_categories"
  add_foreign_key "ratings", "recipes"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_utensils", "recipes"
  add_foreign_key "recipe_utensils", "utensils"
  add_foreign_key "recipes", "recipe_categories"
  add_foreign_key "recipes", "users"
  add_foreign_key "shopping_bag_items", "ingredients"
  add_foreign_key "shopping_bag_items", "shopping_bags"
  add_foreign_key "shopping_bags", "users"
end
