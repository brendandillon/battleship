require './test/test_helper'

class CellTest < Minitest::Test

  def test_it_starts_unoccupied
    cell = Cell.new

    assert_equal nil, cell.occupied_by
  end

  def test_it_can_be_occupied
    cell = Cell.new
    ship = Ship.new(3)

    cell.occupy_with(ship)

    assert_equal ship, cell.occupied_by
  end

  def test_it_starts_unfired_on
    cell = Cell.new

    assert_equal false, cell.fired_on?
  end

  def test_it_can_be_fired_on
    cell = Cell.new

    cell.fire_on

    assert_equal true, cell.fired_on?
  end

  def test_a_ship_is_unhit_if_the_cell_is_unfired_on
    cell = Cell.new
    ship = Ship.new(3)

    cell.occupy_with(ship)

    assert_equal false, cell.fired_on?
    assert_equal 0, ship.hit_count
  end

  def test_a_ship_is_hit_when_the_cell_is_fired_on
    cell = Cell.new
    ship = Ship.new(3)

    cell.occupy_with(ship)
    cell.fire_on

    assert_equal 1, ship.hit_count
  end

end
