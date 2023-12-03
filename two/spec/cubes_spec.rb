require './lib/cubes'

RSpec.describe Cubes do
  let(:file) { '../fixtures/cubes.txt' }
  let(:cubes) { Cubes.new(file) }

  it 'exists' do
    expect(cubes).to be_an_instance_of(Cubes)
  end

  describe '#split_game_data' do
    it 'splits data into game with hash pointing to results' do
      result = {
        1 => [" 3 blue, 4 red", " 1 red, 2 green, 6 blue", " 2 green"],
        2 => [" 1 blue, 2 green", " 3 green, 4 blue, 1 red", " 1 green, 1 blue"],
        3 => [" 8 green, 6 blue, 20 red", " 5 blue, 4 red, 13 green", " 5 green, 1 red"],
        4 => [" 1 green, 3 red, 6 blue", " 3 green, 6 red", " 3 green, 15 blue, 14 red"],
        5 => [" 6 red, 1 blue, 3 green", " 2 blue, 1 red, 2 green"]
      }
      expect(cubes.split_game_data).to eq(result)
    end
  end

  describe '#parse_game_data' do
    it 'parses game result data' do
      result = {
        1 => [{"blue" => 3, "red" => 4}, {"red" => 1, "green" => 2, "blue" => 6}, {"green" => 2}],
        2 => [{"blue" => 1, "green" => 2}, {"green" => 3, "blue" => 4, "red" => 1}, {"green" => 1, "blue" => 1}],
        3 => [{"green" => 8, "blue" => 6, "red" => 20}, {"blue" => 5, "red" => 4, "green" => 13}, {"green" => 5, "red" => 1}],
        4 => [{"green" => 1, "red" => 3, "blue" => 6}, {"green" => 3, "red" => 6}, {"green" => 3, "blue" => 15, "red" => 14}],
        5 => [{"red" => 6, "blue" => 1, "green" => 3}, {"blue" => 2, "red" => 1, "green" => 2}]
      }
      expect(cubes.parse_game_data).to eq(result)
    end
  end

  describe '#find_valid_games' do
   it 'finds ids of valid games' do
    expect(cubes.find_valid_games).to eq([1, 2, 5])
   end
  end

  describe '#valid_game_id_sum' do
    it 'gets the sum of all valid game ids' do
      data = [1, 2, 5]
      allow(cubes).to receive(:find_valid_games).and_return(data)
      expect(cubes.valid_game_id_sum).to eq(8)
    end
  end
end