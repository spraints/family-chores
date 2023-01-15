module CreateGame
  def create_game(actor:)
    attrs = {
      code: SecureRandom.alphanumeric(6),
      state: Game::STATE_INIT,
    }

    case actor
    when User
      attrs[:started_by] = actor
    when Visitor
      attrs[:started_by_visitor_id] = actor.id
    else
      raise ArgumentError, "invalid actor type #{actor.class}"
    end

    Game.create!(attrs)
  end
end
