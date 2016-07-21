class RobotBlueprint
  attr_reader :coordinate,
              :static_index,
              :length

  def initialize(length)
    @static_index = rand(2)
    @incrementing_index = (1 - @static_index).abs
    @length = length
    @coordinate = generate_location
  end

  def generate_location
    starting_cell = pick_starting_cell
    generate_rest_of_cells(starting_cell)
  end

  def pick_starting_cell
    [rand(5 - @length), rand(5 - @length)]
  end

  def generate_rest_of_cells(starting_cell)
    location = [starting_cell]
    (@length - 1).times do |index|
      this_cell = Array.new(2)
      this_cell[@static_index] = starting_cell[@static_index]
      this_cell[@incrementing_index] = location[index][@incrementing_index] + 1
      location << this_cell
    end
    location
  end

end
