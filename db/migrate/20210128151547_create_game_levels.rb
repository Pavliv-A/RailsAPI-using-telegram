class CreateGameLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :game_levels do |t|
      t.belongs_to :game
      t.belongs_to :level
      t.integer :priority

      t.timestamps
    end
  end
end
