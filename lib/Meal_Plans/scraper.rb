require'pry'
# binding.pry
class MealPlans::Scraper


def get_page
  Nokogiri::HTML(open("https://www.reviewed.com/cooking/best-right-now/the-best-meal-kit-delivery-services"))

end



def build_plans
  html_plans = get_page

  html_plans.css(".c-product-widget").each do |plan|
    MealPlans::Plans.new_plan(plan)
  end
end



end


