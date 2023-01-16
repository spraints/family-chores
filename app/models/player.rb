class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def ready?
    false
  end
end
