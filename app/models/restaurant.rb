class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # si on supprime un resto, ça supprime aussi les reviews
  validates :name, :address, :category, presence: true

  CATEGORIES = %w[chinese italian japanese french belgian].freeze
  # obliger de le f iger pour éviter qu'on modifie son contenu
  validates :category, inclusion: { in: CATEGORIES }
  # catégorie doit être dans la liste
end
