class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :score
      t.references :group, foreign_key: true
      t.references :player_info, foreign_key: true

      t.timestamps
    end
  end
end
