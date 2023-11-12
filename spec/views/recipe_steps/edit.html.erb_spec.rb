require 'rails_helper'

RSpec.describe "recipe_steps/edit", type: :view do
  let(:recipe_step) {
    RecipeStep.create!()
  }

  before(:each) do
    assign(:recipe_step, recipe_step)
  end

  it "renders the edit recipe_step form" do
    render

    assert_select "form[action=?][method=?]", recipe_step_path(recipe_step), "post" do
    end
  end
end
