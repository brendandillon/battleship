require './test/test_helper'

class RulesTest < Minitest::Test

  def test_it_makes_sure_all_cells_are_in_a_line
    rules = Rules.new
    assert_equal true, rules.in_line?([[0,0], [0,1], [0,3]])
    assert_equal true, rules.in_line?([[0,0], [1,0], [3,0]])
    assert_equal false, rules.in_line?([[0,0], [0,1], [1,1]])
    assert_equal false, rules.in_line?([[0,0], [1,1], [2,2]])
  end

  def test_it_makes_sure_all_cells_are_adjacent
    rules = Rules.new

    rules.in_line?([[0,0], [0,1], [0,2]])

    assert_equal true, rules.adjacent?([[0,0], [0,1], [0,2]])
    assert_equal false, rules.adjacent?([[0,0], [0,1], [0,3]])

    assert_equal true, rules.in_line?([[0,0], [1,0], [2,0]])

    assert_equal true, rules.adjacent?([[0,0], [1,0], [2,0]])
    assert_equal false, rules.adjacent?([[0,0], [1,0], [3,0]])
  end

end
