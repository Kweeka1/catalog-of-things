require 'date'
require_relative './item'

class Game < Item
  attr_accessor :last_played_at

  def initialize(publish_date, last_played_at, multiplayer)
    @publish_date = Date.parse(publish_date)
    super(@publish_date)
    @last_played_at = Date.parse(last_played_at)
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && Date.today.year - @last_played_at.year > 2
  end
end
