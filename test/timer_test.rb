require './test/test_helper'

class TimerTest < Minitest::Test

  def test_it_times_a_short_interval
    timer = Timer.new

    timer.start
    sleep 2
    timer.stop

    assert_equal 2, timer.get_time.to_i
  end
  
end
