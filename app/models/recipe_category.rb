class RecipeCategory < ApplicationRecord
  belongs_to :user
  has_many :recipes

  validates :name, presence: true
end
