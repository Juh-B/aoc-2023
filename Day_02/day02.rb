class Day02
  file = File.readlines('./input.txt')
  # 12 red cubes, 13 green cubes, and 14 blue cubes
  file.each do |line|
    # separar as jogadas
    # decifar quantos cubos de cada cor por vez
    # verificar se eh possivel

    games = line.chomp.split(/[:\;]/)
    # p games

    # games.each do |game|
      colors = ['blue', 'red', 'green']
      expression = /(\d+)\s*(#{colors.join('|')})/

      games.each do |game|
        matches = game.scan(expression)

        if matches.any?
          cubes = Hash[matches]
          p cubes
          if cubes.all? { |color, count| count.to_i <= { 'red' => 12, 'blue' => 14, 'green' => 13 }[color] }
      #       puts "Deu bom"
      #     else
      #       p "haha"
          end
      #   else
      #     "ops"
        end
      end

      # red_cubes = game.match(/(\d+)\s*red/)
      # blue_cubes = game.match(/(\d+)\s*blue/)
      # green_cubes = game.match(/(\d+)\s*green/)
      # cubes = [red_cubes, blue_cubes, green_cubes]

      # if colors.any? { |color| game.include?(color) }

      #   if cubes
      #     if (red_cubes[1].to_i <= 12 && blue_cubes[1].to_i <= 14 && green_cubes[1].to_i <= 13)
      #       p "deu bom"
      #     else
      #       p "muitos cubos"
      #     end
      #   else
      #     p "FALTA cubo"
      #   end
      #   p "hi"
      # else
      #   p "no"
      # end






    #   if blue_cubes
    #     p number_of_blue
    #   end
    #   # p (game.match(/(\d+)\s*blue/)[1])
    # else
    #   p "no"
    #   # p game
    # end



    # if ((game.scan(/\d+\sred/)[0]).scan(/\d/).join <= "12" &&
    #     (game.scan(/\d+\sblue/)[0]).scan(/\d/).join <= "13" &&
    #     (game.scan(/\d+\sgreen/)[0]).scan(/\d/).join <= "14")
    #     p "hi"
    # end
      # p game.scan(/(\d+)\s*green/)
      # number_near_green = match[1].to_i
      # p game.scan(/\d+\sred/)
      # (game.scan(/\d+\sblue/)[0]).scan(/\d/).join

      # p game
    end

  end



# end
