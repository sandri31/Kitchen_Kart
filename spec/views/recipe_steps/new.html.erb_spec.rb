require 'rails_helper'

RSpec.describe "recipe_steps/new", type: :view do
  before(:each) do
    assign(:recipe_step, RecipeStep.new())
  end

  it "renders new recipe_step form" do
    render

    assert_select "form[action=?][method=?]", recipe_steps_path, "post" do
    end
  end
end
