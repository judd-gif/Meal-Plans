class MealPlans::Plans

    attr_accessor :name, :type, :url
URLS = {
     "Muscle Gain" => "https://www.medicalnewstoday.com/articles/bodybuilding-meal-plan#7-day-meal-plan", 
     "Weight Gain" => "https://www.skinnytaste.com/7-day-weight-loss-meal-plan-march-9-15/",
     "Keto Diet" => "https://www.atkins.com/how-it-works/library/articles/7-day-keto-meal-plan"
}
def self.today(url)
# Scrape Websits and the return deals based on the data.
self.scrape_plans(url)
end


def self.scrape_plans(url)
    doc = Nokogiri::HTML(open(url))
    plan = self.new
  
    
    plan
end 


def self.scrape_muscle_gain
doc = Nokogiri::HTML(open("https://www.medicalnewstoday.com/articles/bodybuilding-meal-plan#7-day-meal-plan"))

plan = self.new
plan.name = doc.search("div.css-z468a2.h1").text.strip
plan.type = list = doc.search("div.css-0").text.strip 

plan
end

def self.scrape_weight_gain
doc = Nokogiri::HTML(open("https://www.skinnytaste.com/7-day-weight-loss-meal-plan-march-9-15/"))

plan = self.new
plan.name = doc.search("h1.post-title").text.strip
plan.type = list = doc.search("img.lazyloaded").text.strip
    
plan
end

def self.scrape_Keto_Diet
doc = Nokogiri::HTML(open("https://www.atkins.com/how-it-works/library/articles/7-day-keto-meal-plan"))

plan = self.new
plan.name = doc.search("div.medium-8 columns left-content-column.h1").text.strip
plan.type = list = doc.search("div.medium-8 columns left-content-column.h2").text.strip

plan
end


end