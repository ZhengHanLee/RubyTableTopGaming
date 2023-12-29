require_relative "Army.rb"
require_relative "EnhancedUnit.rb"
require_relative "Hero.rb"
require_relative "Monster.rb"
require_relative "Squad.rb"
require_relative "Unit.rb"
require_relative "Upgrade.rb"


if __FILE__ == $0

  if ARGV.length != 2 
    puts "Usage: ruby main.rb <Input file> <Output file>"
    exit
  end
  input = ARGV[0]
  output = ARGV[1]

  out = File.open(output, 'w')
  
  #Keep track of current units for adding Upgrades
  $currentUnit = nil
  $currentEnhancedUnit = nil
  $currentSquad = nil
  $currentArmy = nil

  #Functions for Creating format
  #Create an Enhanced Unit
  def create_enhanced_unit(name, points, special_rule, out)
    enhanced_unit = EnhancedUnit.new(name, points)
    enhanced_unit.specialrule = special_rule
    $currentEnhancedUnit = enhanced_unit
    $currentUnit = enhanced_unit
    out.puts "Creating Enhanced Unit: #{enhanced_unit.name}, #{enhanced_unit.getPoints}"
    out.puts "\t" + enhanced_unit.to_s
    #Check for a squad to add enhanced unit to
    if $currentSquad != nil
      $currentSquad.addUnit(enhanced_unit)
      out.puts "Adding Enhanced Unit to Squad"
      out.puts "\t" + $currentSquad.to_s
    end
  end

  #Create a Hero
  def create_hero(name, points, out)
    hero = Hero.new(name, points)
    $currentEnhancedUnit = hero
    $currentUnit = hero
    out.puts "Creating Hero: #{hero.name}, #{hero.getPoints}"
    out.puts "\t" + hero.to_s
    #Check for an squad to add hero to
    if $currentSquad != nil
      $currentSquad.addUnit(hero)
      out.puts "Adding Hero to Squad\n"
      out.puts "\t" + $currentSquad.to_s
    end
  end

  #Create an Upgrade
  def create_upgrade(name, points, out)
    upgrade = Upgrade.new(name, points)
    out.puts "Creating Upgrade: #{upgrade.getName}, #{upgrade.getPoints}"
    out.puts "\t" + upgrade.to_s
    #Check for a unit to add upgrade to
    if $currentUnit != nil
      $currentUnit.addUpgrade(upgrade)
      out.puts "Adding Upgrade to Unit\n"
      out.puts "\t" + $currentUnit.to_s
    end
  end

  #Create a Monster
  def create_monster(name, points, special_rule, out)
    monster = Monster.new(name, points)
    monster.specialrule = special_rule
    $currentEnhancedUnit = monster
    $currentUnit = monster
    out.puts "Creating Monster: #{monster.name}, #{monster.points}"
    out.puts "\t" + monster.to_s
    #Check for an squad to add monster to
    if $currentSquad != nil
      $currentSquad.addUnit(monster)
      out.puts "Adding Monster to Squad\n"
      out.puts "\t" + $currentSquad.to_s
    end
  end

  #Create an Army
  def create_army(army_name, player_name, faction, out)
    $currentArmy = Army.new(army_name, player_name, faction)
    out.puts "Creating Army: #{$currentArmy.name}, #{$currentArmy.player_name}, #{$currentArmy.player_faction}"
    out.puts "\t" + $currentArmy.to_s
  end

  #Create a Squad
  def create_squad(name, out)
    $currentSquad = Squad.new(name)
    out.puts "Creating Squad: #{$currentSquad.name}"
    out.puts "\t" + $currentSquad.to_s
    #Check for an army to add squad to
    if $currentArmy != nil
      $currentArmy.addUnit($currentSquad)
      out.puts "Adding Squad to Army\n"
      out.puts "\t" + $currentArmy.to_s
    end
  end
  
  #Create a Unit
  def create_unit(name, points, out)
    unit = Unit.new(name, points)
    $currentUnit = unit
    out.puts "Creating Unit: #{unit.name}, #{unit.points}"
    out.puts "\t" + unit.to_s
    #Check for an squad to add unit to
    if $currentSquad != nil
      $currentSquad.addUnit($currentUnit)
      out.puts "Adding Unit to Squad\n"
      out.puts "\t" + $currentSquad.to_s
    end
  end

  #Handle line by line
  File.foreach(input) do |line|
    tokens = line.chomp.split("\t")

    case tokens[0]
    when 'Enhanced Unit:'
      create_enhanced_unit(tokens[1], tokens[2].to_i, tokens[3], out)
    when 'Hero:'
      create_hero(tokens[1], tokens[2].to_i, out)
    when 'Upgrade:'
      create_upgrade(tokens[1], tokens[2].to_i, out)
    when 'Monster:'
      create_monster(tokens[1], tokens[2].to_i, tokens[3], out)
    when 'Army:'
      create_army(tokens[1], tokens[2], tokens[3], out)
    when 'Unit:'
      create_unit(tokens[1], tokens[2].to_i, out)
    when 'Squad:'
      create_squad(tokens[1], out)
    when 'Special Rule:'
      if $currentEnhancedUnit != nil
        out.puts "Adding special rule #{tokens[1]} to #{$currentEnhancedUnit.to_s}"
        $currentEnhancedUnit.specialrule = (tokens[1])
        out.puts "Added special rule #{tokens[1]} to #{$currentEnhancedUnit.to_s}"
      end
      
    end
  end

  #Summary of Units
  out.puts "Summary of final units\n"
  out.puts "Last army: #{$currentArmy.to_s}"
  out.puts "Last squad: #{$currentSquad.to_s}"
  out.puts "Last enhanced unit: #{$currentEnhancedUnit.to_s}"
  out.puts "Last unit: #{$currentUnit.to_s}"
  out.close
end