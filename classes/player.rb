class Player
# getters
  attr_reader :name, :ap
#setters
  # attr_writer 
#Both getters and setters
  attr_accessor :hp

  def initialize name
    @name = name
    @hp = 20
    @ap = 10
  end

  def attacks(ennemy)
   # current_jedi will attack the ennemy_jedi
    puts "#{name} attacks #{ennemy.name}"
    # generate random attack points
    attack_points = rand(@ap) + 1

    # The ennemy will take damage
    ennemy.takes_damage(attack_points)
  end

  def takes_damage(points)
    puts "#{name} is taking #{points} points of damage"
    @hp -= points
  end

  def dead?
    @hp <= 0
  end

  # define a getter for name
  # def name
  #   @name
  # end

  # def ap
  #   @ap
  # end

  # def hp
  #   @hp
  # end

  # setter
  #  def hp= points
  #   @hp = points 
  #  end

end