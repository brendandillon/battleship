class Timer

  def initialize
    @start_time
    @stop_time
  end

  def start
    @start_time = Time.now
  end

  def stop
    @stop_time = Time.now
  end

  def get_time
    @stop_time - @start_time
  end

end
