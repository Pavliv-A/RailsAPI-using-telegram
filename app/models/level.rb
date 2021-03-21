class Level < ApplicationRecord
  validates :game_level, presence: true, numericality: { only_integer: true }, length: { maximum: 4 }

  has_many :game_levels
  has_many :games, through: :game_levels
end
