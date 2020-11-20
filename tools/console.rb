require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


vc1 = VentureCapitalist.new("Richard Branson")
vc1.total_worth = 1000000001

vc2 = VentureCapitalist.new("Bichard Ranson")
vc2.total_worth = 999999999

s1 = Startup.new("StartupName1", "StartupDomain1", "Elon")
s2 = Startup.new("StartupName2", "StartupDomain2", "founder1")
s3 = Startup.new("StartupName3", "StartupDomain3", "founder2")

s1.sign_contract(vc1, "Angel", 101.00)
s1.sign_contract(vc1, "Angel", 102.00)
s1.sign_contract(vc2, "Angel", 103.00)
s2.sign_contract(vc1, "Angel", 104.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line