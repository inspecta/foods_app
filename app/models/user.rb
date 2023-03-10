class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2 }
  validates :password, presence: true
  validates :email, presence: true

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
end
