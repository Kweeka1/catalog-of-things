class Genre
    attr_accessor :name,:items
    attr_reader :id
    def initialize(name, id: Random.rand(0..10_000))
        @name = name
        @id = id
        @items = []
    end

    def add_item(item)
        @items << item
        item.add_genre = self
    end

end