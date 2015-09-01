class Game < ActiveRecord::Base
  has_many :game_players

  validates :number_of_players_must_be_2

  def number_of_players_must_be_2
    if self.players.size != 2
      errors.add(:number_of_players, "must be 2")
    end
  end
end
