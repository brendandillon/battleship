require './lib/board'
require './lib/rules'

class Player

  include Display
  include Rules

  attr_reader :board,
              :shot_count

  def initialize
    @board = Board.new
    @shot_count = 0
  end

  def enter_ships
    enter_one_ship(2)
    enter_one_ship(3)
  end

  def enter_one_ship(length)
    ship_blueprint = create_blueprint(length)
    if not_overlapping?(ship_blueprint)
      @board.place_ship(ship_blueprint)
    else
      enter_one_ship(length)
    end
  end

  def increase_shot_count
    @shot_count += 1
  end
end
