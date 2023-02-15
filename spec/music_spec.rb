require_relative '../music/music'

describe Music do
  context 'Testing for music class' do
    it 'Should return 2022 and true value in music class' do
      music = Music.new('2022', true)
      expect(music.publish_date).to eq '2022'
      expect(music.on_spotify).to eq true
      expect(music.id).to be_between(0, 10_000).exclusive
    end

    it 'Should return 2020 and false value in music class' do
      music = Music.new('2020', false)
      expect(music.publish_date).to eq '2020'
      expect(music.on_spotify).to eq false
      expect(music.id).to be_between(0, 10_000).exclusive
    end
  end
end
