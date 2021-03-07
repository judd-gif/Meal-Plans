#Our CLI Controller
require "pry"

class MealPlans::CLI
    
    def call
        MealPlans::Scraper.new.build_plans
        puts "These are the Top 10 Best Meal Plans in 2021!"
        menu

    end

    def menu
        puts ""
        puts "What number Meal Plan whould you like more information about? 1-13?"
        input = gets.strip.to_i

        print_meal_plans(input)

        puts""
        puts "what Meal Plan would you like more information on?"
        input = gets.strip

        plans = MealPlans::Plans.find(input.to_i)

        print_meal_plans(plans)

        puts ""
        puts "Would you like to see another restuarant? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
        start
        elsif input == "n"
        puts ""
        puts "Thank you! Have a great day!"
        exit
        else
        puts ""
        puts "I don't understand that answer."
        start
        end
    end

    def print_meal_plans(plans)
        puts ""
        puts "-----------#{plans.name}-#{plans.position}------------"
        puts ""
        puts "#{plans.price}"
        puts ""
        puts ""
        puts "-----------Description-----------"
        puts ""
        puts "#{plans.description"






    end


end

