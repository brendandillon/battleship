require './lib/player'
require './lib/display'
require './lib/input'

class Human < Player

  include Display
  include Input
  include Rules

  def enter_ships
    super
    begin_game(self)
  end

  def create_blueprint(length)
    blueprint = convert_to_coordinates(add_a_ship(length, self))
    # until acceptable?(blueprint)
    #   blueprint = convert_to_coordinates(add_a_ship(length, self))
    # end
  end

  def fire_shot
    convert_to_coordinates(get_shot_location)[0]
  end

end
