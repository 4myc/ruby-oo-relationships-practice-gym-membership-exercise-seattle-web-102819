class Lifter
  attr_reader :name
  attr_accessor :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  # Get a list of all lifters
  def self.all
    @@all
  end

  # Get a list of all the memberships that a specific lifter has
  def lifter_memberships
    Membership.all.select {|membership| membership.lifter == self}
  end
  # ALTERNATIVE METHOD
  # Membership.all.each do |membership|
  #   membership.lifter == self
  # end

  # Get a list of all the gyms that a specific lifter has memberships to
  def gym_memberships
    lifter_memberships.map {|m| m.gym}
  end
  # Used previous method (lifter_memberships) a helper method to abstract code, avoid "DRY", && get each lifter's memberships
  # Used .map to find the names of the gyms

  # ALTERNATIVE METHOD #1
  # Membership.all.select {|membership| membership.lifter == self}.map {|m| m.gym}

  # ALTERNATIVE METHOD #2
  # def gym_memberships
  #   gyms = []
  #   Membership.all.each do |membership|
  #     if membership.lifter == self
  #       gyms << membership.gym.name
  #     end
  #   end
  #   gyms
  # end

  # Get the average lift total of all lifters
  def self.lifters_average
    lifts_total = @@all.map {|lifter| lifter.lift_total} 
      lifts_total.sum / lifts_total.length
  end 
  # Used .map to retrieve each lifter's total
  # Used .sum to add up all lifters' totals and divided by number of lifts

  # ALTERNATIVE METHOD #1
  # def self.lifters_average
  #   lifts_total = @@all.map {|lifter| lifter.lift_total} 
  #     lifts_total.reduce(:+) / lifts_total.size
  # end 

  # ALTERNATIVE METHOD #2
  # def self.lifters_average
  #   lifts_total = @@all.map do |lifter|  #Using .map to go thru list of all lifters and retrieve the lift total of all lifters
  #     lifter.lift_total
  #   end 
  #     return lifts_total.inject do |sum, element| 
  #       sum + element
  #     end / lifts_total.length 
  # end 

  # Get the total cost of a specific lifter's gym memberships
  def total_cost
    lifter_memberships.map {|m| m.cost}.sum
  end
  # Used previous method (lifter_memberships) as a helper method to avoid DRY

  # ALTERNATIVE METHOD
  # Membership.all.select {|m| m.lifter == self}.map {|m| m.cost}.sum

  # Given a gym and a membership cost, sign a specific lifter up for a new gym
  def new_membership(gym, cost)
    Membership.new(cost, self, gym)
  end
end
