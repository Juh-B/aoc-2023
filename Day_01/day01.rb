class Day01
  file = File.readlines('./input.txt')

  # # Part 01
  part_01_calibration = 0

  file.each do |line|
    numbers = []

    numbers << line.scan(/\d/).first
    numbers << line.scan(/\d/).last

    part_01_calibration += numbers.join.to_i
  end

  # # Part 02
  part_02_calibration = 0

  file.each do |line|
    number = []
    words = {
      'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5',
      'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9',
      'eno' => '1', 'owt' => '2', 'eerht' => '3', 'ruof' => '4', 'evif' => '5',
      'xis' => '6', 'neves' => '7', 'thgie' => '8', 'enin' => '9',
      '1' => '1', '2' => '2', '3' => '3', '4' => '4', '5' => '5',
      '6' => '6', '7' => '7', '8' => '8', '9' => '9', '0' => '0'
    }

    first_digits = line.scan(/\d|one|two|three|four|five|six|seven|eight|nine/)
    last_digits = line.reverse.scan(/\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/)

    number << words[first_digits[0]]
    number << words[last_digits[0]]

    part_02_calibration += number.join.to_i
  end

  puts "Part 01 -> The sum of the calibration values is #{part_01_calibration}."
  puts '------------'
  puts "Part 02 -> The sum of the calibration values is #{part_02_calibration}."
end
