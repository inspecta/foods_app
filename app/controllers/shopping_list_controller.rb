class ShoppingListController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def show
    @foods = Food.where(user_id: current_user.id)
  end
end
