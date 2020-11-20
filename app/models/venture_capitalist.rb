class VentureCapitalist

  attr_accessor :total_worth
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.filter {|vc| vc.total_worth >= 1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.map {|fr| fr.startup}.uniq
  end

  def biggest_investment
    self.funding_rounds.max_by {|fr| fr.investment}
  end

  def invested(domain)
    Startup.all.find {|s| s.domain == domain}.funding_rounds.filter {|fr| fr.venture_capitalist == self}.sum {|fr| fr.investment}
  end
end

