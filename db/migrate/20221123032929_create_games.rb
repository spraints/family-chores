class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :started_by, foreign_key: {to_table: :users}
      t.string :started_by_visitor_id
      t.string :state
      t.string :code, limit: 6

      t.timestamps
    end
    add_index :games, :code
    add_index :games, :started_by_visitor_id
  end
end
