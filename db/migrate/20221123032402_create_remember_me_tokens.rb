class CreateRememberMeTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :remember_me_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token

      t.timestamps
    end
    add_index :remember_me_tokens, :token, unique: true
  end
end
