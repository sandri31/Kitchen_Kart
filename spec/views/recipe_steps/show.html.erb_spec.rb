require 'rails_helper'

RSpec.describe "recipe_steps/show", type: :view do
  before(:each) do
    assign(:recipe_step, RecipeStep.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
