class Day02
  file = File.readlines('./sample.txt')
  # 12 red cubes, 13 green cubes, and 14 blue cubes
  possible_games = 0

  file.each do |line|
    games = line.chomp.split(/[:\;]/)

    game_possibility = 0
    game_round = 0
    colors = ['blue', 'red', 'green']
    expression = /(\d+)\s*(#{colors.join('|')})/

    games.each do |game|
      matches = game.scan(expression)
      matches.each do |match|
        cube = []
        cube << match.reverse
        cubes = Hash[cube]

        if cubes.all? { |color, quantity| quantity.to_i <= { 'red' => 12, 'blue' => 14, 'green' => 13 }[color] }
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
  # puts "Part 02 -> The sum of the possible games is #{possible_games}."
end
