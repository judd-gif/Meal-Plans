#Our CLI Controller
require "pry"

class MealPlans::CLI
    
    def call
        MealPlans::Scraper.new.build_plans
        puts "These are the Top 13 Best Meal Plans in 2021!"
        menu

    end

    def menu
        puts ""
        puts "Which Top 13 Meal Plans would you like more information about? 1-13?"
        input = gets.strip.to_i

        print_meal_plan_detail(input)


        puts""
        puts "what Meal Plan would you like more information on?"
        input = gets.strip

        plan = MealPlans::Plans.find(input.to_i)

        print_meal_plans(plan)

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
        puts ""
        puts "I don't understand that answer."
        start
        end
    end

    def print_meal_plan_detail(plan_ID)
        plan = MealPlans::Plans.all(plan_ID-1)
        puts ""
        puts "-----------#{plan.name}-#{plan.position}------------"
        puts ""
        puts "#{plan.price}"
        puts ""
        puts ""
        puts "-----------Description-----------"
        puts ""
        puts "#{plan.description}"
        puts ""
    end

    def print_meal_plans(from_number)
        puts ""
        puts "---------- Top Meal Plans #{from_number} - #{from_number+12} ----------"
        puts ""
        MealPlans::Plans.all[from_number-1, 13].each.with_index(from_number) do |plan, index|
          puts "#{index}. #{plan.name} - #{plan.position}"
        end



    end


end

