class Player

  def initialize(name)
    # instance variable
    @name = name
    @hp = 20
    @ap = 10
  end

  def name
    @name
  end

  def ap
    @ap
  end

  def hp
    @hp
  end

  def hp=(points)
    @hp = points
  end

  def dead?
    @hp <= 0
  end

  def attacks(defense)
    # attack jedi attack defense jedi
    puts "#{@name} is attacking #{defense.name}"

    # defense jedi is taking points of damage
    
    damage = rand(@ap) + 1
  
    defense.takes_damage(damage)

  end

  def takes_damage(points)
    puts "#{@name} is taking #{points} points of damage!"
  
    # its life is substracted
    @hp -= points

  end

end