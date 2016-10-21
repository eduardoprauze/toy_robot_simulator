module Directions

  DIRECTIONS = {
    north: 0,
    east: 90,
    south: 180,
    west: 270
  }

  def self.get_name(degrees)
    DIRECTIONS.key(degrees).to_s
  end

  def self.get_degrees(name)
    DIRECTIONS.fetch(name.downcase.to_sym, 0).to_i
  end

end
