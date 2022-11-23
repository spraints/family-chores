class Game < ApplicationRecord
  belongs_to :started_by, class_name: "User"
end
