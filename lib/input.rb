module Input

  def convert_to_coordinates(positions)
    positions = positions.downcase
    set_of_coordinates = positions.split.map do |position|
      coordinate = []
      coordinate << position[0].ord - 97  # converts "a" to 0
      coordinate << position[1].ord - 49  # converts "1" to 0
    end
  end

end
