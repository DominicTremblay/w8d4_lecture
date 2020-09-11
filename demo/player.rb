class Player

  attrib_reader :name, :ap
  attrib_accessor :hp

  def initialize(name)
    @name=name
    @hp=20
    @ap=10
  end

  def dead?
    @hp <= 0
  end

  def attacks(defender)

    
    puts "> #{@name} attacks #{defender.name}"
    damage = rand(@ap) + 1

    defender.take_damage(damage)

  end

  def take_damage(points)
    
    puts "> #{self.name} is taking #{points} damage points"

    @hp -= points
  end

end