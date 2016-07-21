require './lib/cell'
require './lib/ship'

class Board
  attr_reader :grid,
              :ship_count

  def initialize
    @grid = []
    @ship_count = 0
    fill_board
  end

  def fill_board
    4.times do
      this_row = []
      4.times do
        this_row << Cell.new
      end
      @grid << this_row
    end
  end

  def place_ship(ship_location)
    ship_to_place = Ship.new(ship_location.length)
    occupy_cells(ship_location, ship_to_place)
    @ship_count += 1
  end

  def sink_ship
    @ship_count -= 1
  end

  def game_over?
    @ship_count == 0 ? true : false
  end

  def occupy_cells(ship_location, ship_to_place)
    ship_location.each do |location|
      @grid[location[0]][location[1]].occupy_with(ship_to_place)
    end
  end

end
