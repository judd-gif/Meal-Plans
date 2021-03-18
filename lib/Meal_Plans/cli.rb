#Our CLI Controller
require "pry"

class MealPlans::CLI
    def call
        MealPlans::Scraper.new.build_plans
        puts "These are the Top 4 Best Meal Plans in 2021!"
        MealPlans::Plans.all[0..3].each_with_index do |meal_plan, index|
            puts "#{index + 1}. #{meal_plan.name}"
        end
        menu

    end

    def menu
        puts ""
        puts "Which Top 8 Meal Plans would you like more information about? 1-4?"
        input = gets.strip.to_i

        print_meal_plan_detail(input)
        puts""
        ask_again 
    end

    def print_meal_plan_detail(plan_ID)
        plan = MealPlans::Plans.find(plan_ID)
        puts ""
        puts ""
        puts "#{plan.name}"
        puts ""
        puts "#{plan.description}"
        puts ""
        puts "#{plan.price}"
        puts ""
    end

    def ask_again
        puts ""
        puts "Would you like to see another Meal Plan? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
            menu
        elsif input == "n"
            puts ""
            puts "Thank you! Have a great day!"
            exit
        else
            puts "I don't understand that answer."
            ask_again
        end
    end

end
