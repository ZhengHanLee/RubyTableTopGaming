# RubyTableTopGaming
This program is written in Ruby and implements a series of classes to simulate the popular pass time of table top gaming.


Unit: The Unit class is the base of the hierarchy. It will implement the basic fields for the rest of the tree. The Unit must have a field for the following:
        quality
        defence
        name
        points
        upgrades

For the to_s, it will return a string in the following format:

Name of Unit (points, quality, defense) 

If the Unit has any Upgrades those will be appended to the end of the Unit’s to_s using the to_s for each of the Upgrades that the Unit contains.


EnhancedUnit is a direct subclass of the Unit. In addition to what the Unit provides, the EnhancedUnit will add a specialrule field and appropriate setters and getters for the field.

For the to_s method the EnhancedUnit will add to the string provided by its parent the following

special rule: [the special rule it contains]

Hero and Monster: The Hero and Monster are two subclasses of EnhancedUnit.

They will have the same constructor as the Unit and pass their parameters to their parent for initialization.

Squad: In table top gaming, players will organize their unit’s into groups, called squads. So we will model this with a Sqaud class. It will also subclass the EnhancedUnit. The Squad will add the ability to store units in an array.

For getting the points for the squad, this will be the sum of the points for each of its units, using the getPoints for the Unit. This should have the Unit also provide a sum of its points, if it were to have any upgrades added to it.

The to_s will be of the following format:

units: <followed by the to_s for each unit>

If there are no units in the Squad, then nothing is added to the string.

Army: The final layer of this hierarchy is the Army. The army is a subclass of the Squad. The Army will store in addition to its subclass(es) a Name for the player and that players associated Faction.

The to_s for the Army will add the player’s name and faction to the front of the string.

Player: Player's Name faction: faction name

and then after that will be added the to_s from the parent.


# Example
Input

Below is a sample input file. Note, each line is terminated with a newline character. Between the tokens on the line are the tab character (. There will not be tabs anywhere else on the line, except between the tokens.

The first token on the line can be in any case, upper, lower, mixed, etc.

    Army:   Army Name   Player Name Faction Name
    Squad:  Squad Name
    Hero:   Hero Name   100
    Monster:    Monster Name    100
    Enhanced Unit:  Enhanced Unit Name  100 Special Rule
    Special Rule:   Special Rule Update
    Unit:   Name    100
    Upgrade:    Upgrade Name    100

Output

Below is what the program would output after reading the given input file.
    
    Creating Army: Army Name, Player Name, Faction Name
        Player: Player Name,  faction: Faction Name, army: Army Name (0, 2, 2)
    Creating Squad: Squad Name
        Squad Name (0, 2, 2)
    Adding Squad to Army
        Player: Player Name,  faction: Faction Name, army: Army Name (0, 2, 2) units: Squad Name (0, 2, 2) 
    Creating Hero: Hero Name, 100
        Hero Name (100, 5, 5)
    Adding Hero to Squad
        Squad Name (100, 2, 2) units: Hero Name (100, 5, 5) 
    Creating Monster: Monster Name, 100
        Monster Name (100, 4, 4)
    Adding Monster to Squad
        Squad Name (200, 2, 2) units: Hero Name (100, 5, 5) Monster Name (100, 4, 4) 
    Creating Enhanced Unit: Enhanced Unit Name, 100
        Enhanced Unit Name (100, 2, 2) special rule: [Special Rule]
    Adding Enhanced Unit to Squad
        Squad Name (300, 2, 2) units: Hero Name (100, 5, 5) Monster Name (100, 4, 4) Enhanced Unit Name (100, 2, 2) special rule: [Special Rule] 
    Adding special rule Special Rule Update to Enhanced Unit Name (100, 2, 2) special rule: [Special Rule]
    Added special rule Special Rule Update to Enhanced Unit Name (100, 2, 2) special rule: [Special Rule Update]
    Creating Unit: Name, 100
        Name (100, 2, 2)
    Adding Unit to Squad
        Squad Name (400, 2, 2) units: Hero Name (100, 5, 5) Monster Name (100, 4, 4) Enhanced Unit Name (100, 2, 2) special rule: [Special Rule Update] Name (100, 2, 2) 
    Creating Upgrade: Upgrade Name, 100
        Upgrade Name (100)
    Adding Upgrade to Unit
        Name (200, 2, 2) upgrades: [Upgrade Name (100)]
    Summary of final units
    Last army: Player: Player Name,  faction: Faction Name, army: Army Name (500, 2, 2) units: Squad Name (500, 2, 2) units: Hero Name (100, 5, 5) Monster Name (100, 4, 4) Enhanced Unit Name (100, 2, 2) special rule: [Special Rule Update] Name (200, 2, 2) upgrades: [Upgrade Name (100)]  
    Last squad: Squad Name (500, 2, 2) units: Hero Name (100, 5, 5) Monster Name (100, 4, 4) Enhanced Unit Name (100, 2, 2) special rule: [Special Rule Update] Name (200, 2, 2) upgrades: [Upgrade Name (100)] 
    Last enhanced unit: Enhanced Unit Name (100, 2, 2) special rule: [Special Rule Update]
    Last unit: Name (200, 2, 2) upgrades: [Upgrade Name (100)]
