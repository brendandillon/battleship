require './lib/player'
require './lib/display'
require './lib/input'
require './lib/rules'

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
    until acceptable?(blueprint)
      blueprint = convert_to_coordinates(add_a_ship(length, self))
    end
    blueprint
  end

  def fire_shot
    shot = convert_to_coordinates(get_shot_location)
    until on_grid?(shot)
      shot = convert_to_coordinates(get_shot_location)
    end
    shot[0]
  end

end
