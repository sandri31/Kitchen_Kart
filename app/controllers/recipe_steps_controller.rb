class RecipeStepsController < ApplicationController
  before_action :set_recipe_step, only: %i[edit update destroy]

  # GET /recipe_steps or /recipe_steps.json
  def index
    @recipe_steps = RecipeStep.order(:step_number)
  end

  # GET /recipe_steps/new
  def new
    @recipe_step = RecipeStep.new
  end

  # GET /recipe_steps/1/edit
  def edit
    RecipeStep.find(params[:id])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(@recipe_step,
                                                partial: 'recipe_steps/form',
                                                locals: { recipe_step: @recipe_step })
      end
    end
  end

  # POST /recipe_steps or /recipe_steps.json
  def create
    @recipe_step = RecipeStep.new(recipe_step_params)

    respond_to do |format|
      if @recipe_step.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update(new_recipe_step,
                                partial: 'recipe_steps/form',
                                locals: { recipe_step: RecipeStep.new }),
            turbo_stream.append('recipe_steps',
                                partial: 'recipe_steps/step',
                                locals: { recipe_step: @recipe_step })
          ]
        end
        format.html { redirect_to recipe_step_url(@recipe_step), notice: 'Recipe step was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_recipe_step',
                                partial: 'recipe_steps/form',
                                locals: { recipe_step: @recipe_step })
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_steps/1 or /recipe_steps/1.json
  def update
    respond_to do |format|
      if @recipe_step.update(recipe_step_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(@recipe_step,
                                                   partial: 'recipe_steps/recipe_step',
                                                   locals: { recipe_step: @recipe_step })
        end
        format.html { redirect_to recipe_step_url(@recipe_step), notice: 'Recipe step was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(@recipe_step,
                                                   partial: 'recipe_steps/form',
                                                   locals: { recipe_step: @recipe_step })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_steps/1 or /recipe_steps/1.json
  def destroy
    @recipe_step.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@recipe_step) }
      format.html { redirect_to recipe_steps_url, notice: 'Recipe step was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_step
    @recipe_step = RecipeStep.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_step_params
    params.require(:recipe_step).permit(:instructions, :recipe_id, :step_number)
  end
end
