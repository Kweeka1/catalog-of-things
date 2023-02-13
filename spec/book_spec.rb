require_relative '../book'
require 'date'

describe Book do
  let(:book1) { Book.new('Fire And Blood', Date.parse('2023-02-13'), 'George RR Martin', 'good', 1) }
  let(:book2) { Book.new('Game of Thrones', Date.parse('2023-02-13'), 'George RR Martin', 'bad', 2) }
  let(:book3) { Book.new('Hunter\'s run', Date.parse('2012-02-13'), 'George RR Martin', 'good', 3) }

  # evaluate to false since book's publish date is less than 10 years and it's cover state is good
  it 'can_be_archived? method should return false' do
    expect(book1.can_be_archived?).to be false
  end

  # evaluate to true since book's cover state is bad
  it 'can_be_archived? method should return true' do
    expect(book2.can_be_archived?).to be true
  end

  # evaluate to true since book's publish date is older than 10 years
  it 'can_be_archived? method should return true' do
    expect(book3.can_be_archived?).to be true
  end

  it 'to_object method should return book\'s record in hash format' do
    expect(book3.to_object).to eq({
                                    'id' => 3,
                                    'title' => 'Hunter\'s run',
                                    'publisher' => 'George RR Martin',
                                    'publish_date' => Date.parse('2012-02-13'),
                                    'cover_state' => 'good'
                                  })
  end
end
