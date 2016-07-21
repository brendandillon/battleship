require './test/test_helper'

class PlayerTest < Minitest::Test

  def test_it_has_a_board
    player = Player.new

    assert_equal true, player.board.is_a?(Board)
  end

end
