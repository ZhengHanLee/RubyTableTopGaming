require_relative "EnhancedUnit.rb"

class Hero < EnhancedUnit
    #Constructor
    def initialize(name, points)
        super(name, points)
        @quality = 5
        @defence = 5
    end
end