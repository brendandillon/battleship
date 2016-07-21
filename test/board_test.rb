require './test/test_helper'

class BoardTest < Minitest::Test

  def test_it_is_filled_with_cells
   board = Board.new

   assert_equal true, board.grid[0][1].is_a?(Cell)
   assert_equal true, board.grid[1][2].is_a?(Cell)
   assert_equal true, board.grid[2][3].is_a?(Cell)
   assert_equal true, board.grid[3][0].is_a?(Cell)
  end

  def test_it_starts_with_no_ships
    board = Board.new

    assert_equal 0, board.ship_count
  end

  def test_it_can_place_a_ship
    board = Board.new

    board.place_ship([[0,0], [0,1], [0,2]])

    assert_equal 1, board.ship_count
  end

  def test_a_ship_is_placed_in_the_correct_location
    board = Board.new

    board.place_ship([[0,0], [0,1], [0,2]])

    assert_equal true, board.grid[0][0].occupied_by.is_a?(Ship)
    assert_equal true, board.grid[0][1].occupied_by.is_a?(Ship)
    assert_equal true, board.grid[0][2].occupied_by.is_a?(Ship)
end

end
