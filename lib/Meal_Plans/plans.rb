class MealPlans::Plans

    attr_accessor :name, :type, :url
URLS = {
     "Muscle Gain" => "https://themealprepninja.com/7-day-meal-plan-for-muscle-gain/", 
     "Weight Gain" => "https://www.skinnytaste.com/7-day-weight-loss-meal-plan-march-9-15/",
}
def self.today(url)
# Scrape Websits and the return deals based on the data.
self.scrape_plans(url)
end

# def self.scrape_plans
#     plans = []

# plans << self.scrape_muscle_gain
# plans << self.scrape_weight_gain


# plans
# end

def self.scrape_plans(url)
    doc = Nokogiri::HTML(open(url))
    plan = self.new
    plan.name = doc.search("h1.entry-title").text.strip
    plan.type = list = doc.search("div.entry-content").text.strip 
    
    plan


end 
def self.scrape_muscle_gain
doc = Nokogiri::HTML(open("https://themealprepninja.com/7-day-meal-plan-for-muscle-gain/"))

plan = self.new
plan.name = doc.search("h1.entry-title").text.strip
plan.type = list = doc.search("div.entry-content").text.strip 

plan
end

def self.scrape_weight_gain
doc = Nokogiri::HTML(open("https://www.skinnytaste.com/7-day-weight-loss-meal-plan-march-9-15/"))

plan = self.new
plan.name = doc.search("h1.entry-title").text.strip
plan.type = list = doc.search("div.entry-content").text.strip
    
plan


end


end