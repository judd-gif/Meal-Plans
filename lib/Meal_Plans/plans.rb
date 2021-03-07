require 'pry'
class MealPlans::Plans

    attr_accessor :name, :type, :price, :position, :discount

@@all = []

def self.new_plan
    self.new

end

def initialize(name=nil, type=nil, price=nil, discount=nil)
@name = name
@type = type
@price = price
@discount = discount
@@all << self

end

def self.all
    @@all
end

def self.find(id)
    self.all[id-1]
end


def doc
    @doc ||= Nokogiri::HTML(open(self.url))
end



end