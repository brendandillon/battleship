require './test/test_helper'

class GameTest < Minitest::Test

  def test_it_creates_a_robot
    game = Game.new

    assert_equal true, game.robot.is_a?(Robot)
  end

  def test_it_creates_a_player
    game = Game.new

    assert_equal true, game.human.is_a?(Human)
  end

  def test_it_creates_a_timer
    game = Game.new

    assert_equal true, game.timer.is_a?(Timer)
  end
end
