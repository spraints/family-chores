class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :visitor_id
      t.string :name

      t.timestamps
    end
    add_index :players, :visitor_id
  end
end
