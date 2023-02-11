class UsersController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
    @recipes = Recipe.where(user_id: current_user.id)
  end
end
