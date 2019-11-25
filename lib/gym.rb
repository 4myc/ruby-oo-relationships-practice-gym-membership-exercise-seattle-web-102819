class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # Get a list of all gyms
  def self.all
    @@all
  end

  # Get a list of all memberships at a specific gym
  def memberships
    Membership.all.select {|m| m.gym == self}
  end

  #Get a list of all the lifters that have a membership to a specific gym
  def lifters
    memberships.map {|m| m.lifter}
  end
  # Used previous method (memberships) as a helper method to find each gym's memberships && avoid DRY
  # Used .map to retrieve every lifter's name with that specific gym membership

  # Get a list of the names of all lifters that have a membership to that gym
  def name
    lifters.map {|l| l.name}
  end

  # Get the combined lift total of every lifter has a membership to that gym
  def total 
    lifters.map {|l| l.lift_total}.sum
  end
end
