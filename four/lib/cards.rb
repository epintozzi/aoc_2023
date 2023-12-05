class Cards
  attr_reader :contents, :all_card_numbers, :all_my_numbers

  def initialize(file)
    @contents = File.readlines(file).map do |line|
      clean = line.chomp.split(':')
      clean[1].strip
    end
    @all_card_numbers = []
    @all_my_numbers = []
    create_card_sets
  end

  def create_card_sets
    contents.each do |game_set|
      splits = game_set.split('|')
      @all_card_numbers << splits.first.strip.split.map {|n| n.to_i}
      @all_my_numbers << splits.last.split.map {|n| n.to_i}
    end
  end

  def find_winning_numbers
    all_card_numbers.map.with_index do |card_set, i|
      card_set.intersection(all_my_numbers[i])
    end
  end

  def calculate_point_total
    find_winning_numbers.sum do |match_set|
      if match_set.empty?
        0
      else
        2**(match_set.count-1)
      end
    end
  end
end