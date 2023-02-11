class Recipe < ApplicationRecord
  attr_accessor :public

  before_save :set_public

  # Associations
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :public, presence: true

  # Set public recipe attributes
  private

  def set_public
    self.public ||= false
  end
end
