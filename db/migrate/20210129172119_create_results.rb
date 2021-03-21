class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :sportsman_name
      t.integer :result
    end
  end
end
