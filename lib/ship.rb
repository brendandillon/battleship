class Ship
  attr_reader :length,
              :hit_count

  def initialize(length)
    @length = length
    @hit_count = 0
    @sunk = false
  end

  def sunk?
    @length == @hit_count ? true : false
  end

  def hit
    @hit_count += 1
  end

end
