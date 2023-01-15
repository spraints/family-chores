class Game < ApplicationRecord
  belongs_to :started_by, class_name: "User", inverse_of: :games, optional: true
  has_many :players

  STATE_INIT = "init"

  def to_s
    code
  end

  def to_param
    code
  end

  def self.find_by_code(code)
    find_by!(code: code.to_s)
  end

  def find_player(actor)
    case actor
    when Visitor
      players.where(visitor_id: actor.id).first
    when User
      players.where(user_id: actor.id).first
    else
      nil
    end
  end
end
