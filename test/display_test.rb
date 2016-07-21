require "./test/test_helper"

# class Display
#   def get_user_input
#     $user_input_for_testing_only
#   end
# end

class DisplayTest < Minitest::Test


  def test_it_starts_with_welcome
    skip
    disp = Display.new
    welcome_message = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"

    assert_output(stdout = welcome_message) {disp.welcome}
  end

  def test_it_gets_an_option
    skip
    disp = Display.new
    user_input_for_testing_only = "p\n"

    disp.welcome
    user_input_for_testing_only.gets

    assert_equal "p", disp.menu_choice
  end

  def test_it_gets_a_different_option
    skip
    disp = Display.new
    $user_input_for_testing_only = "i\n"

    disp.welcome

    assert_equal "i", disp.menu_choice
  end

  def test_it_can_take_a_word_as_input
    skip
    disp = Display.new
    $user_input_for_testing_only = "play\n"

    disp.welcome

    assert_equal "p", disp.menu_choice
  end

  def test_it_is_case_insensitive
    skip
    disp = Display.new
    $user_input_for_testing_only = "P\n"

    disp.welcome

    assert_equal "p", disp.menu_choice
  end

  def test_it_cannot_take_other_values
    skip
    disp = Display.new
    $user_input_for_testing_only = "n"
    error_message = "Sorry, (n) was not recognized.\nPlease enter (p) to play, (i) to read the instructions, or (q) to quit.\n"

    assert_output(stdout = error_message) {disp.evaluate_user_choice}
  end

  def test_it_asks_for_new_value_after_invalid_input
    skip
    disp = Display.new
    $user_input_for_testing_only = "n"
    welcome_message = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
    error_message = "Sorry, (n) was not recognized.\nPlease enter (p) to play, (i) to read the instructions, or (q) to quit.\n"
  end



end
