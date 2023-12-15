require 'set'
class Day03
  file = File.readlines('./input.txt')

  # Part 01
  syms = []
  file.each_with_index do |row, x|
    row.chomp.each_char.with_index do |char, y|
      next if char == "."
      next if char =~ /\d/
      syms << [x, y]
    end
  end

  number_locations =[]
  syms.each do |(x, y)|
    [
      [-1,-1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1],
    ].each do |(dx, dy)|
      nx = x + dx
      ny = y + dy
      if file[nx][ny] =~ /\d/
        number_locations << [nx, ny]
      end
    end
  end

  number_starts = Set.new
  number_locations.each do |(x, y)|
    while file[x][y - 1] =~ /\d/
      y -= 1
    end
    number_starts << [x, y]
  end

  result = number_starts.map do |(x, y)|
    file[x][y..].to_i
  end

  puts "Part 01 -> The sum of the part numbers in the engine schematic is #{result.sum}."
  puts '------------'


  # Part 02
  syms_02 = []
  file.each_with_index do |row, x|
    row.chomp.each_char.with_index do |char, y|
        syms_02 << [x, y] if char == "*"
    end
  end

  gear_ratios = []
  syms_02.each do |(x, y)|
    number_locations =[]
    [
      [-1,-1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1],
    ].each do |(dx, dy)|
      nx = x + dx
      ny = y + dy
      if file[nx][ny] =~ /\d/
        number_locations << [nx, ny]
      end
    end

    number_starts = Set.new
    number_locations.each do |(x, y)|
      while file[x][y - 1] =~ /\d/
        y -= 1
      end
      number_starts << [x, y]
    end

    if number_starts.length == 2
      result = number_starts.map do |(x, y)|
        file[x][y..].to_i
      end.inject(:*)
      gear_ratios << result
    end
  end

  puts "Part 02 -> The sum of all of the gear ratios is #{gear_ratios.sum}."
end
