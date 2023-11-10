# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }
  let(:recipe_category) { create(:recipe_category, name: 'Dessert') }

  subject(:recipe) do
    build(:recipe,
      user: user,
      recipe_category: recipe_category,
      title: 'Tarte aux pommes',
      cooking_time: 30,
      preparation_time: 15,
      difficulty: 'Facile',
      cost: 'Bon marché',
      servings: 10,
      description: 'Une délicieuse tarte aux pommes.'
    )
  end

  # Associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:recipe_category) }
  it { is_expected.to have_many(:recipe_ingredients).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:ratings).dependent(:destroy) }
  it { is_expected.to have_many(:recipe_utensils) }
  it { is_expected.to have_many(:utensils).through(:recipe_utensils) }
  it { is_expected.to have_many(:recipe_steps).dependent(:destroy) }

  # Validations
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_numericality_of(:cooking_time).only_integer.is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:preparation_time).only_integer.is_greater_than(0) }
  it { is_expected.to validate_inclusion_of(:difficulty).in_array(%w[Facile Moyen Difficile]) }
  it { is_expected.to validate_length_of(:description).is_at_least(10).is_at_most(1000) }

  # Enums
  it { is_expected.to define_enum_for(:status).with_values(initial_draft: 0, published: 1, archived: 2, private_status: 3).with_prefix(:status) }

  # Méthodes
  describe '#calculate_total_time' do
    it 'calculates the total time as the sum of cooking and preparation time' do
      recipe.save
      expect(recipe.total_time).to eq(45)
    end
  end
end
