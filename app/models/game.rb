class Game < ApplicationRecord
    has_many :cards
    has_many :participants
end
