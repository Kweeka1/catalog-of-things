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
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
