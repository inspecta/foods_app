class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where('public = ? OR user_id = ?', true, current_user.id).order('created_at DESC')
  end
end
