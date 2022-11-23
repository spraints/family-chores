class User < ApplicationRecord
  has_many :remember_me_tokens
  has_many :players
  has_many :games, inverse_of: :started_by
end
