require 'date'
require 'time'

class Item
  # @param [Date] publish_date
  def initialize(publish_date, id = Random.rand(0, 10_000), archived: false)
    @publish_date = publish_date
    @archived = archived
    @id = id
  end

  def can_be_archived?
    return true if Time.now.year - @publish_date.year > 10

    false
  end

  def move_to_archive
    can_be_archived = can_be_archived?
    return unless can_be_archived

    @archived = true
  end
end
