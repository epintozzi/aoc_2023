require './lib/cards'

RSpec.describe Cards do
  let(:file) { '../fixtures/cards.txt' }
  let(:cards) { Cards.new(file) }

  it 'exists' do
    expect(cards).to be_an_instance_of(Cards)
  end

  describe '#create_card_sets' do
    it 'parses data into card sets' do
      game_numbers = [
        [41, 48, 83, 86, 17], 
        [13, 32, 20, 16, 61], 
        [1, 21, 53, 59, 44],
        [41, 92, 73, 84, 69], 
        [87, 83, 26, 28, 32], 
        [31, 18, 13, 56, 72] 
      ]
      my_numbers = [
        [83, 86, 6, 31, 17,  9, 48, 53],
        [61, 30, 68, 82, 17, 32, 24, 19],
        [69, 82, 63, 72, 16, 21, 14, 1],
        [59, 84, 76, 51, 58,  5, 54, 83],
        [88, 30, 70, 12, 93, 22, 82, 36],
        [74, 77, 10, 23, 35, 67, 36, 11]
      ]
      expect(cards.all_card_numbers).to eq(game_numbers)
      expect(cards.all_my_numbers).to eq(my_numbers)
    end
  end

  describe '#find_winning_numbers' do
    it 'finds winning numbers on the card when multiple matches' do
      allow(cards).to receive(:all_card_numbers).and_return([[41, 48, 83, 86, 17]])
      allow(cards).to receive(:all_my_numbers).and_return([[83, 86,  6, 31, 17,  9, 48, 53]])
      expect(cards.find_winning_numbers).to eq([[48, 83, 86, 17]])
    end
    it 'finds winning numbers on the card when one match' do
      allow(cards).to receive(:all_card_numbers).and_return([[41, 92, 73, 84, 69]])
      allow(cards).to receive(:all_my_numbers).and_return([[59, 84, 76, 51, 58, 5, 54, 83]])
      expect(cards.find_winning_numbers).to eq([[84]])
    end
    it 'finds winning numbers on the card when no match' do
      allow(cards).to receive(:all_card_numbers).and_return([[87, 83, 26, 28, 32]])
      allow(cards).to receive(:all_my_numbers).and_return([[88, 30, 70, 12, 93, 22, 82, 36]])
      expect(cards.find_winning_numbers).to eq([[]])
    end
  end

  describe '#calculate_point_total' do
    it 'returns total point' do
      numbers = [
        [48, 83, 86, 17],
        [32, 61],
        [1, 21],
        [84],
        [],
        []
      ]
      allow(cards).to receive(:find_winning_numbers).and_return(numbers)
      expect(cards.calculate_point_total).to eq(13)
    end
  end
end