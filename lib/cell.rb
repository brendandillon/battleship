class Cell
  attr_reader :occupied_by
  
  def initialize
    @occupied_by
    @occupied = false
    @fired_on = false
  end

  def occupy_with(ship)
    @occupied_by = ship
    @occupied = true
  end

  def fire_on
    @fired_on = true
    @occupied_by.hit if @occupied_by.is_a?(Ship)
  end

  def fired_on?
    @fired_on
  end

  def occupied?
    @occupied
  end

end
