require_relative '../game'

describe Game do
  let(:game1) { Game.new('Call of duty', '2010/01/01', '2015/05/05', true) }
  let(:game2) { Game.new('Castlevenia', '2023/01/01', '2023/05/05', false) }

  it 'can be archived? method return true' do
    expect(game1.can_be_archived?).to be true
  end

  it 'can be archived? method return false' do
    expect(game2.can_be_archived?).to be false
  end

  it 'name equal to' do
    expect(game1.name).to eq 'Call of duty'
    expect(game2.name).to eq 'Castlevenia'
  end
end
