require_relative '../game/author'
require_relative '../game/game'

describe Author do
  let(:game1) { Game.new('Call of duty', '2010/01/01', '2015/05/05', true) }
  let(:game2) { Game.new('Castlevenia', '2023/01/01', '2023/05/05', false) }
  let(:author) { Author.new('belal', 'gamal') }

  it 'add_item method should add to items array' do
    author.add_item(game1)
    author.add_item(game1)
    expect(author.items.length).to be 2
    expect(author.items[0]).to be_an_instance_of Game
    expect(author.items[1]).to be_an_instance_of Game
  end
end
