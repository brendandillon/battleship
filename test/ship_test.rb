require './test/test_helper'

class ShipTest < Minitest::Test

  def test_it_has_a_length
    ship = Ship.new(3)

    assert_equal 3, ship.length
  end

  def test_it_knows_it_is_not_sunk
    ship = Ship.new(3)

    assert_equal false, ship.sunk?
  end

  def test_it_can_be_hit
    ship = Ship.new(3)

    ship.hit

    assert_equal 1, ship.hit_count
  end

  def test_it_knows_how_many_times_its_been_hit
    ship = Ship.new(3)

    ship.hit
    ship.hit

    assert_equal 2, ship.hit_count
  end

  def test_it_is_sunk_when_hit_count_is_the_same_as_length
    ship = Ship.new(3)

    ship.hit
    ship.hit
    ship.hit

    assert_equal true, ship.sunk?
  end

end
