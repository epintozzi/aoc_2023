require './lib/calibration'

RSpec.describe Calibration do
  let(:file) { 'spec/fixtures/calibration.txt' }
  let(:calibration) { Calibration.new(file) }

  it 'exists' do
    expect(calibration).to be_an_instance_of(Calibration)
  end

  describe '#find_digits' do
    # 1abc2
    # pqr3stu8vwx
    # a1b2c3d4e5f
    # treb7uchet
    it 'find_digits when first and last digits are the first and last chars' do
      result = calibration.find_digits('1abc2')
      expect(result).to eq(12)
    end
    it 'find_digits when first and last digits are in the middle and only 2 digit chars' do
      result = calibration.find_digits('pqr3stu8vwx')
      expect(result).to eq(38)
    end
    it 'find_digits when first and last digits when multiple digit chars' do
      result = calibration.find_digits('a1b2c3d4e5f')
      expect(result).to eq(15)
    end
    it 'find_digits when only one digit char' do
      result = calibration.find_digits('treb7uchet')
      expect(result).to eq(77)
    end
  end

  describe '#find_digits_alphanumeric' do
    # two1nine
    # eightwothree
    # abcone2threexyz
    # xtwone3four
    # 4nineeightseven2
    # zoneight234
    # 7pqrstsixteen
    it 'find_digits_alphanumeric when numeral in middle' do
      result = calibration.find_digits('two1nine')
      expect(result).to eq(29)
    end
    it 'find_digits when all are words' do
      result = calibration.find_digits('eightwothree')
      expect(result).to eq(83)
    end
    it 'find_digits when all are words and extra chars' do
      result = calibration.find_digits('abcone2threexyz')
      expect(result).to eq(13)
    end
    it 'find_digits when words blend from left' do
      result = calibration.find_digits('xtwone3four')
      expect(result).to eq(24)
    end
    it 'find_digits when words blend from right' do
      result = calibration.find_digits('1eightwo')
      expect(result).to eq(12)
    end
    it 'find_digits when first and last are numerals' do
      result = calibration.find_digits('4nineeightseven2')
      expect(result).to eq(42)
    end
    it 'find_digits when last is numeral and first is word' do
      result = calibration.find_digits('zoneight234')
      expect(result).to eq(14)
    end
    it 'find_digits when first is numeral and last is word' do
      result = calibration.find_digits('7pqrstsixteen')
      expect(result).to eq(76)
    end
  end

  describe '#find_digits_for_all_lines' do
    it '#calculates for all lines' do
      content = %w(1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet)
      allow(calibration).to receive(:contents).and_return(content)
      expect(calibration.find_digits_for_all_lines).to eq(142)
    end
    it '#calculates for all lines alphanumeric' do
      content = %w(two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 1eightwo zoneight234 7pqrstsixteen)
      allow(calibration).to receive(:contents).and_return(content)
      expect(calibration.find_digits_for_all_lines).to eq(293)
    end
  end
end