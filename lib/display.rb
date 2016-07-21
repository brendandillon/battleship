module Display

  def main_menu
    welcome
    input = main_menu_choice
    case input
    when 'p'
      Game.new
    when 'i'
      instructions
      main_menu
    when 'q'
      exit
    end
  end

  def welcome
    print "\e[H\e[2J"
    print "Welcome to BATTLESHIP\n\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end

  def main_menu_choice
    input = gets.chomp.downcase[0]
    if input == "p" || input == "i" || input == "q"
      return input
    else
      print "Sorry, (#{input}) was not recognized.\nPlease enter (p) to play, (i) to read the instructions, or (q) to quit.\n> "
      main_menu_choice
    end
  end

  def instructions
    puts "Battleship is a game of naval warfare. You will begin by placing two ships on the board.\n" +
    "Enter the squares you want to place your ship in like so: 'A1 A2 A3'.\n" +
    "Once you have placed your ships, it is time to fire on your opponent!\n" +
    "Enter the square of your opponent's board that you want to fire on.\n" +
    "After you have fired, it is your opponent's turn!\n" +
    "The game will be over when you have sunk all of your opponent's ships or when all of your ships have been sunk.\n" +
    "Have fun!"
    print "[back]"
    gets
  end

  def add_a_ship(length, player)
    if length == 2
      add_2_length_ship(player)
    elsif length == 3
      add_3_length_ship(player)
    end
  end

  def add_2_length_ship(human)
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\n" +
    "The first is two units long and the\nsecond is three units long.\n" +
    "The grid has A1 at the top left and D4 at the bottom right."
    show_human_board(human)
    print "Enter the squares for the two-unit ship:\n> "
    gets.chomp
  end

  def add_3_length_ship(human)
    show_human_board(human)
    print "Enter the squares for the three-unit ship:\n> "
    gets.chomp
  end

  def begin_game(human)
    show_human_board(human)
    print "[Begin the game]"
    gets
  end

  def get_shot_location
    print "Enter the coordinates you would like to fire at:\n> "
    gets.chomp
  end

  def show_robot_board(robot)
    show_board(robot) do |cell|
      if cell.occupied? && cell.fired_on?
        print " H "
      elsif cell.fired_on?
        print " M "
      else
        print " o "
      end
    end
  end

  def show_human_board(human)
    show_board(human) do |cell|
      if cell.occupied? && cell.fired_on?
        print " H "
      elsif cell.fired_on?
        print " M "
      elsif cell.occupied?
        print " # "
      else
        print " o "
      end
    end
  end

  def radar_title
    puts "\nRadar"
  end

  def your_ships_title
    puts "\n=============\n"
    puts "\nYour ships"
  end

  def show_board(player)
    puts "\n=============\n" +
         ".  1  2  3  4 "
    player.board.grid.each.with_index do |row, index|
      print "#{(index + 65).chr} "
      row.each do |cell|
        yield(cell)
      end
      print "\n"
    end
    puts "=============\n\n"
  end

  def end_game_message
    if @human.board.ship_count == 0
      puts "Sorry, you lost.\n"+
           "The computer took #{@robot.shot_count} shots to sink your ships.\n" +
           "The game took #{stop_timing} seconds to play."
    else
      puts "Congratulations, you won!\n" +
           "It took you #{@human.shot_count} shots to sink your opponent's ships.\n" +
           "The game took #{stop_timing} seconds to play."
    end
    print "[exit]"
    gets
    exit
  end
end
