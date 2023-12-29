#Parent Unit class
require_relative "GameElement.rb"

class Unit
    include GameElement 
    #Fields
    attr_accessor :quality
    attr_accessor :defence
    attr_reader :name
    attr_reader :points
    attr_accessor :upgrades

    #Constructor
    def initialize(name, points)
        @quality = 2
        @defence = 2
        @name = name
        @points = points
        @upgrades = []
    end

    #Public Instance Methods
    #Add an upgrade
    def addUpgrade(upgrade)
        upgrades.append(upgrade)
    end

    #Return the total amount of points, summing them up from all upgrades
    def getPoints
        total_points = @points
        if @upgrades.length != 0
            @upgrades.each do |upgrade|
                if upgrade != nil
                    total_points += upgrade.getPoints.to_i
                end
            end
        end
        return total_points.to_s
    end

    #Return upgrades
    def getUpgrades
        upgrades
    end

    #Remove upgrade
    def removeUpgrade(upgrade)
        upgrades.delete(upgrade)
    end

    #Convert to String
    def to_s
        upgrade_str = upgrades.empty? ? '' : "upgrades: [#{upgrades.map(&:to_s).join(', ')}] "
        sprintf("#{@name} (#{getPoints}, #{@quality}, #{@defence}) #{upgrade_str}")
    end
end