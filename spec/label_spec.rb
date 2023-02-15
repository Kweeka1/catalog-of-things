require_relative '../book/book'
require_relative '../book/label'
require 'rspec'

describe 'Label' do
  let(:book1) { Book.new('Fire And Blood', Date.parse('2023-02-13'), 'George RR Martin', 'good', 1) }
  let(:book2) { Book.new('Game of Thrones', Date.parse('2023-02-13'), 'George RR Martin', 'bad', 2) }
  let(:label) { Label.new('Gift', 'Blue', [], 1) }

  it 'add_item method should establish a one to many relationship with book instances' do
    label.add_item book1
    label.add_item book2

    expect(label.items.length).to eq 2
    expect(label.items[0]).to be_an_instance_of Book
    expect(label.items[1]).to be_an_instance_of Book
  end

  it 'to_object method should return label\'s record in hash format' do
    expect(label.to_object).to eq({
                                    'id' => 1,
                                    'title' => 'Gift',
                                    'color' => 'Blue',
                                    'items' => []
                                  })
  end
end
