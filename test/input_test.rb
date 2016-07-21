require './test/test_helper'

class InputTest < Minitest::Test

  require './lib/input'

  def test_it_converts_player_input_to_coordinates
    assert_equal [[0,0]], Input.convert_to_coordinates("a1")
  end

  def test_it_is_not_case_sensitive
    assert_equal [[0,0]], Input.convert_to_coordinates("A1")
  end

  def test_it_can_accept_multiple_player_inputs
    assert_equal [[0,0], [3,2]], Input.convert_to_coordinates("a1 d3")
  end

end
