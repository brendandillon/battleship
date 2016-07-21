require './lib/board'
require './lib/robot_blueprint'

class Robot < Player

  def create_blueprint(length)
    RobotBlueprint.new(length).coordinate
  end

  def fire_shot
    [rand(3), rand(3)]
  end

end
