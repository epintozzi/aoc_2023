class Cubes
  attr_reader :contents

  def initialize(file)
    @contents = File.readlines(file).map do |line|
      line.chomp
    end
  end

  def split_game_data
    data = Hash.new
    contents.each do |game|
      g = game.split(':')
      data[g.first.split.last.to_i] = g.last.split(';')
    end
    data
  end

  def parse_game_data
    new_hash = Hash.new([])
    split_game_data.each_with_index do |(k, v), index|
      new_hash[k] = []
      v.each do |data|
        h = {}
        new_hash[k] << h
        data.strip.split(',').each_with_index do |d, i|
          h[d.split.last] = d.split.first.to_i
        end
      end
    end
    new_hash
  end

  def find_valid_games
    valid_ids = []
    parse_game_data.filter_map do |id, game_data|
      score = 0
      game_data.each do |round|
        round.each do |r|
          score += 1 if constraints[r.first] < r.last  
        end
      end
      id if score.zero?
    end
  end

  def valid_game_id_sum
    find_valid_games.sum
  end

  def constraints
    {
      "red" => 12,
      "green" => 13,
      "blue" => 14
    }
  end
end