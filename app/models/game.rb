class Game < ApplicationRecord
  validates :game_name, presence: true, length: { minimum: 3 }

  has_many :game_levels
  has_many :levels, through: :game_levels
end
