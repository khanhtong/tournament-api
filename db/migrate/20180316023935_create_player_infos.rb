class CreatePlayerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :player_infos do |t|
      t.string :name, uniqueness: true

      t.timestamps
    end
  end
end
