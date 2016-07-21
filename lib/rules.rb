module Rules

  def on_grid?(coordinates)
    coordinates.all? { |coordinate| (coordinate[0].between?(0,3)) && (coordinate[1].between?(0,3))} ? true : false
  end

  def in_line?(coordinates)
    if in_row_or_col?(0, coordinates)
      true
    elsif in_row_or_col?(1, coordinates)
      true
    else
      false
    end
  end

  def in_row_or_col?(static_index, coordinates)
    coordinates.all? do |coordinate|
      coordinate[static_index] == coordinates[0][static_index]
    end
  end

  def adjacent?(coordinates)
    if adjacent_by_row_or_col?(0, coordinates)
      true
    elsif adjacent_by_row_or_col?(1, coordinates)
      true
    else
      false
    end
  end

  def adjacent_by_row_or_col?(incrementing_index, coordinates)
    coordinates.each_cons(2).all? do |first, second|
      (first[incrementing_index] + 1) == second[incrementing_index]
    end
  end

  def correct_length?(coordinates, length)
    coordinates.length == length
  end


  def not_overlapping?(coordinates)
    coordinates.none? do |coordinate|
      @board.grid[coordinate[0]][coordinate[1]].occupied_by.is_a?(Ship)
    end
  end

  def acceptable?(coordinates, length)
    on_grid?(coordinates) && in_line?(coordinates) && adjacent?(coordinates) && correct_length?(coordinates, length)
  end

end
