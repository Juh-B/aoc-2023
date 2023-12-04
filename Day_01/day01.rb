class Day01
  file = File.readlines('./sample.txt')

  calibration = 0

  file.each do |line|
    number = []

    number << line.scan(/\d/).first
    number << line.scan(/\d/).last

    calibration += number.join.to_i
  end

  puts "Part 01 -> The sum of the calibration values is #{calibration}."
  puts '------------'
end
