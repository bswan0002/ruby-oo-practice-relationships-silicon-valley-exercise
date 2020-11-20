class Startup
  attr_accessor :name
  attr_reader :domain, :founder

  @@all = []

  def initialize(name, domain, founder)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    Startup.all.find {|s| s.founder == founder}
  end

  def self.domains
    Startup.all.map {|s| s.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.startup == self}
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def total_funds
    self.funding_rounds.sum {|fr| fr.investment}
  end

  def investors
    self.funding_rounds.map {|fr| fr.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.find_all {|i| VentureCapitalist.tres_commas_club.include?(i)}
  end
end
