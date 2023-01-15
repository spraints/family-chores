class Visitor
  def initialize(id: nil)
    @id ||= SecureRandom.hex(16)
  end

  attr_reader :id
end
