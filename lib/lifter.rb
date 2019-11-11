class Lifter
  attr_reader :name
  attr_accessor :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def lifter_memberships
    Membership.all.select {|membership| membership.lifter == self}
  end
  # ALTERNATIVE METHOD
  # Membership.all.each do |membership|
  #   membership.lifter == self
  # end

  def gym_memberships
    lifter_memberships.map {|m| m.gym}
  end
  # Used previous method (lifter_memberships) to abstract code, avoid "DRY" && get each lifter's memberships
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

  def self.lifters_average
    lifts_total = @@all.map {|lifter| lifter.lift_total} 
      lifts_total.sum / lifts_total.length
  end 
  # Used .map to retrieve each lifter's total
  # Used .sum to add up all lifters' totals and divided by number of lifts
  # Used "method chaining" to abstract code

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

  def total_cost
    lifter_memberships.map {|m| m.cost}.sum
  end
  # ALTERNATIVE METHOD
  # Membership.all.select {|m| m.lifter == self}.map {|m| m.cost}.sum

  def new_membership(gym, cost)
    Membership.new(cost, self, gym)
  end
end
