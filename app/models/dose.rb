class Dose < ApplicationRecord
  validates :description, :cocktail_id, :ingredient_id, presence: { message: "must fill all the categories"}

  validates :cocktail_id, uniqueness: { scope: :ingredient_id, message: "This ingredient and this cocktail have already been associated" }
  belongs_to :cocktail
  belongs_to :ingredient
end
