require_relative "EnhancedUnit.rb"

class Monster < EnhancedUnit
    #Constructor
    def initialize(name, points)
        super(name, points)
        @quality = 4
        @defence = 4
    end
end