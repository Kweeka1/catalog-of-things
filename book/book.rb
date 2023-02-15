require_relative '../item'
require 'json'

class Book < Item
  attr_reader :publisher, :cover_state, :title

  # @param [String] title
  # @param [Date] publish_date
  # @param [String] publisher
  # @param [String] cover_state
  # @param [Integer] id
  def initialize(title, publish_date, publisher, cover_state, id = Random.rand(0..10_000))
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
    @title = title
  end

  # @return [Boolean]
  def can_be_archived?
    super || @cover_state == 'bad'
  end

  # @return [Hash]
  def to_object
    {
      'id' => @id,
      'title' => @title,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state
    }
  end
end
