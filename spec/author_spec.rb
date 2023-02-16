require_relative '../author'
require_relative '../game'

describe Author do
  let(:game1) { Game.new('2010/01/01', '2015/05/05', true) }
  let(:game2) { Game.new('2010/01/01', '2015/05/05', true) }
  let(:author) { Author.new('belal', 'gamal') }

  it 'add_item method should add to items array' do
    author.add_item(game1)
    author.add_item(game1)
    expect(author.items.length).to be 2
    expect(author.items[0]).to be_an_instance_of Game
    expect(author.items[1]).to be_an_instance_of Game
  end
end
