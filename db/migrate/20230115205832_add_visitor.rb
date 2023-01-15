class AddVisitor < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :started_by_visitor, :string
    add_index :games, :started_by_visitor

    add_column :players, :visitor_id, :string
    add_index :players, :visitor_id
  end
end
