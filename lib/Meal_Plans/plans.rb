require 'pry'
class MealPlans::Plans

    attr_accessor :name, :price, :description, :discount, :url

@@all = []

def self.new_plan(r)
    self.new(
        r.css("h3").text,
        r.css("p")[1].text,
        r.css(".position").text
    )

end

def initialize(name=nil, type=nil, price=nil, description=nil, discount=nil)
@name = name
@price = price
@description = description
@discount = discount
@@all << self

end

def self.all
    @@all
end

def self.find(h3)
    self.all[h3-1]
end


def doc
    @doc = Nokogiri::HTML(open(self.url))
end



end