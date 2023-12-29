require_relative "Unit.rb"

class EnhancedUnit < Unit
    attr_accessor :specialrule

    #Constructor
    def initialize( name, points )
        super(name, points)
        @specialrule = nil
    end

    #Public Instance Method
    #Convert to String
    def to_s
        special_rule_str = @specialrule.nil? ? '' : "special rule: [#{@specialrule}] "
        super + special_rule_str
    end

end