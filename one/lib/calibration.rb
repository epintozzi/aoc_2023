class Calibration
  attr_reader :contents

  def initialize(file)
    @contents = File.readlines(file).map do |line|
      line.chomp
    end
  end

  def find_digits_for_all_lines
    contents.map do |line|
      find_digits(line)
    end.sum
  end

  def find_digits_left(line)
    line.scan(/one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9/).first
  end

  def find_digits_right(line)
    line.reverse.scan(/eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|1|2|3|4|5|6|7|8|9/).first
  end

  def find_digits(input)
    string = ""
    string << dictionary[find_digits_left(input)]
    string << dictionary[find_digits_right(input)]

    string.to_i
  end

  def dictionary
    {
      'one' => '1',
      'two' => '2',
      'three' => '3',
      'four' => '4',
      'five' => '5',
      'six' => '6',
      'seven' => '7',
      'eight' => '8',
      'nine' => '9',
      'eno' => '1',
      'owt' => '2',
      'eerht' => '3',
      'ruof' => '4',
      'evif' => '5',
      'xis' => '6',
      'neves' => '7',
      'thgie' => '8',
      'enin' => '9',
      '1' => '1',
      '2' => '2',
      '3' => '3',
      '4' => '4',
      '5' => '5',
      '6' => '6',
      '7' => '7',
      '8' => '8',
      '9' => '9'
    }
  end

end