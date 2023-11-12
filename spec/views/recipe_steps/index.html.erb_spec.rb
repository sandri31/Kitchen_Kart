require 'rails_helper'

RSpec.describe "recipe_steps/index", type: :view do
  before(:each) do
    assign(:recipe_steps, [
      RecipeStep.create!(),
      RecipeStep.create!()
    ])
  end

  it "renders a list of recipe_steps" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
