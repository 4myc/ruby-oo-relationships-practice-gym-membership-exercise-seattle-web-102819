# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

bob = Lifter.new("Bob", 20)
sam = Lifter.new("Sam", 200)
jon = Lifter.new("Jon", 5)

la_fitness = Gym.new("La Fitness")
ymca = Gym.new("YMCA")
golds = Gym.new("Gold's")

membership1 = Membership.new(35, bob, la_fitness)
membership2 = Membership.new(50, sam, ymca)
membership3 = Membership.new(43, jon, golds)
membership4 = Membership.new(60, bob, golds)


binding.pry

puts "Gains!"
