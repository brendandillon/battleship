require './test/test_helper'

class RobotBlueprintTest < Minitest::Test

  def test_it_has_an_orientation
    blueprint = RobotBlueprint.new(3)

    assert_equal true, (0 == blueprint.static_index || 1 == blueprint.static_index)
  end

  def test_it_has_a_length
    blueprint = RobotBlueprint.new(3)

    assert_equal 3, blueprint.length
  end

  def test_it_generates_one_coordinate
    blueprint = RobotBlueprint.new(1)

    assert_equal true, blueprint.generate_location[0][0].is_a?(Integer)
    assert_equal true, blueprint.generate_location[0][1].is_a?(Integer)
  end

  def test_it_generates_two_coordinates
    blueprint = RobotBlueprint.new(2)

    assert_equal true, blueprint.generate_location[0][0].is_a?(Integer)
    assert_equal true, blueprint.generate_location[1][1].is_a?(Integer)
  end

  def test_it_generates_coordinates_in_a_row
    blueprint = RobotBlueprint.new(3)

    assert_equal true, ([[0,0], [0,1], [0,2]] == blueprint.generate_rest_of_cells([0,0]) || [[0,0], [1,0], [2,0]] == blueprint.generate_rest_of_cells([0,0]))
  end

end
