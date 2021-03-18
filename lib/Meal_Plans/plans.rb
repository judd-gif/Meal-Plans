require 'pry'
class MealPlans::Plans

    attr_accessor :name, :description, :price
    
    @@all = []

    def self.new_plan(r)
        self.new(
            r.css(".u3").text,
            r.css("strong").first.parent.children.text,
            r.xpath('//strong[contains(text(), "Cost:")]').first.parent.text

        )
    end

    def initialize(name=nil, description=nil, price=nil)
        @name = name
        @description = description
        @price = price
        @@all << self

    end

    def self.all
        @@all
    end
    

    def self.find(h3)
        self.all[h3-1]
    end


 


end