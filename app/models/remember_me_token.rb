class RememberMeToken < ApplicationRecord
  belongs_to :user

  before_create :generate_token!

  def generate_token!
    raise "todo"
  end
end
