class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json

  def show
    # Display foods in recipes
    @foods = Food.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(user_id: current_user.id, **recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html do
          redirect_to user_recipe_url(current_user.id, @recipe.id), notice: 'Recipe was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    # @recipe.destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      respond_to do |format|
        format.html { redirect_to user_recipes_url, notice: 'Recipe was successfully destroyed.' }
      end
    else
      flash.now[:error] = 'Oops. Could not delete the post'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
