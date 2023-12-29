require_relative "Squad.rb"

class Army < Squad
    attr_reader :player_name
    attr_reader :player_faction

    #Constructor
    def initialize(army, name, faction)
        super(army)
        @player_name = name
        @player_faction = faction
    end

    #Public Instance Method
    #Convert to String
    def to_s
        army_info = "Player: #{@player_name},  faction: #{@player_faction}, army: "
        army_info + super
    end
end
