require_relative "EnhancedUnit.rb"

class Squad < EnhancedUnit
    attr_accessor :units

    #Constructor
    def initialize(name) 
        super(name, 0)
        @units = []
    end

    #Public Instance Methods
    #Add Unit
    def addUnit( unit )
        units.append(unit)
    end

    #Return total number of points, summing up from each unit
    def getPoints
        total_points = @points
        if @units.length != 0
            @units.each do |unit|
                if unit != nil
                    total_points += unit.getPoints.to_i
                end
            end
        end
        return total_points.to_s
    end

    #Remove Unit
    def removeUnit( unit )
        units.delete(unit)
    end

    #Convert to String
    def to_s
        unit_str = units.empty? ? '' : "units: #{units.map(&:to_s).join('')}"
        super + unit_str
    end
end
