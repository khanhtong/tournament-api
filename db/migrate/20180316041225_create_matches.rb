class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :name
      t.string :venue
      t.integer :player1_id
      t.integer :player2_id
      t.integer :score_player1
      t.integer :score_player2
      t.integer :is_give_up
      t.references :players, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
  add_foreign_key :players, :player1_id
  add_foreign_key :players, :player2_id
  # add_fo
end
