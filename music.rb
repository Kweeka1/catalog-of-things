require "./item"

class Music < Item
    attr_accessor :publish_date, :on_spotify
    attr_reader :id
    def initialize(publish_date, on_spotify, id: Random.rand(0...10_000))
        super(publish_date)
        @publish_date = publish_date
        @id = id
        @on_spotify = on_spotify
    end

    private
    def can_be_archived?
        super and @on_spotify
    end
    

end