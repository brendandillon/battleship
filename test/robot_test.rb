require './test/test_helper'

class RobotTest < Minitest::Test

  def test_it_has_a_board
    robot = Robot.new

    assert_equal true, robot.board.is_a?(Board)
  end

  def test_it_has_ship_blueprints
    robot = Robot.new

    assert_equal true, robot.create_blueprint(3).is_a?(Array)
  end

  def test_it_can_tell_if_blueprints_are_eligible
    robot = Robot.new
    robot.board.place_ship([[0,0],[0,1]])

    assert_equal true, robot.eligible_to_place?([[0,2], [1,2]])
  end

  def test_it_can_tell_if_blueprints_are_not_eligible
    robot = Robot.new
    robot.board.place_ship([[0,0],[0,1]])

    assert_equal false, robot.eligible_to_place?([[0,1], [1,1]])
  end

  def test_it_can_fire_a_shot
    robot = Robot.new

    robot.fire_shot

    assert_equal 1, robot.shot_count
  end

end
