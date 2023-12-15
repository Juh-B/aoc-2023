require 'set'
class Day03
  file = File.readlines('./sample.txt')

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

  p result.sum
end
