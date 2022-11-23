class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :started_by, null: false, foreign_key: true
      t.string :state
      t.string :code, limit: 6

      t.timestamps
    end
    add_index :games, :code
  end
end
