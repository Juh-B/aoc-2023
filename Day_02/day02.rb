class Day02
  file = File.readlines('./input.txt')

  # Part 01
  possible_games = 0

  file.each do |line|
    games = line.chomp.split(/[:\;]/)

    game_possibility = 0
    game_round = 0
    colors = ['red', 'green', 'blue']
    expression = /(\d+)\s*(#{colors.join('|')})/

    games.each do |game|
      matches = game.scan(expression)
      matches.each do |match|
        cube = []
        cube << match.reverse
        cubes = Hash[cube]

        if cubes.all? { |color, quantity| quantity.to_i <= { 'red' => 12, 'green' => 13, 'blue' => 14 }[color] }
          "Possible"
        else
          "Impossible"
          game_possibility += 1
        end
      end

      round = game.scan("Game")
      if round.any?
        game_round += game.scan(/(\d+)/).join.to_i
      end
    end

    if game_possibility == 0
      possible_games += game_round
    end
  end

  puts "Part 01 -> The sum of the possible games is #{possible_games}."
  puts '------------'

  # Part 02
  power = []

  file.each do |line|
    red_cubes = []
    green_cubes = []
    blue_cubes = []
    colors = ['red', 'green', 'blue']
    expression = /(\d+)\s*(#{colors.join('|')})/

    cubes = line.scan(expression)
    cubes.select do |cube|
      if cube[1] == 'red'
        red_cubes << cube[0].to_i
      elsif cube[1] == 'green'
        green_cubes << cube[0].to_i
      else cube[1] == 'blue'
        blue_cubes << cube[0].to_i
      end
    end

    power << (red_cubes.max * green_cubes.max * blue_cubes.max)
  end

  puts "Part 02 -> The sum of the possible games is #{power.sum}."
end
