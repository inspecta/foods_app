class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: :recipe_id

  validates :quantity, presence: true
end
