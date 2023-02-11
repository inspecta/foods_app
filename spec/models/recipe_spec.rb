require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'd@gmail.com',
      password: 'password'
    )

    @recipe = Recipe.new(
      name: 'Burger', preparation_time: '3', cooking_time: '12pm',
      description: 'Bread and a piece of meat.', public: 'false', user_id: @user.id
    )
  end

  # validations
  describe "recipe#Validations" do
    it "is valid with valid attributes" do
      expect(@recipe).to be_valid
    end

    it "is invalid with invalid attributes" do
      @recipe.name = nil
      expect(@recipe).to be_invalid
    end

    it "is invalid if no description is provided" do
      @recipe.description = nil
      expect(@recipe).to be_invalid
    end
  end
end
