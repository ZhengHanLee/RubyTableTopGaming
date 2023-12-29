require_relative "GameElement.rb"

class Upgrade
    include GameElement
    attr_reader :name
    attr_reader :points

    #Constructor
    def initialize(name, points)
        @name = name
        @points = points
    end

    # Public Instance Methods
    #Return the name
    def getName
        name
    end

    #Return amount of points
    def getPoints
        points
    end

    #Convert to String
    def to_s
        "#{@name} (#{@points})"
    end
end