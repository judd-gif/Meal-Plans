require'pry'
# binding.pry
class MealPlans::Scraper
  
# def scraper
# url = "https://urbantastebud.com/best-meal-kits-for-one-person/"

# end 



def get_page
url = Nokogiri::HTML(open("https://urbantastebud.com/best-meal-kits-for-one-person/"))
end

def scrape_plans
 self.get_page
end 


def build_plans
    scrape_plans.each do
        MealPlans::Plans    
    end
end



end


