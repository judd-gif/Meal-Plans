#Our CLI Controller
require "pry"

class MealPlans::CLI
    
    def call
        list_plans
        menu

        goodbye
    end

    def list_plans
        puts "Time For a Meal Plan!:"
        #@plans = MealPlans::Plans.today
        MealPlans::Plans::URLS.keys.each.with_index(1) do |plan, i|
            puts "#{i}. #{plan}"
        end
    end

    def menu
        input = nil
        while input != "exit"
        puts "Enter the number of the Plan you'd like more info on or type list to see the Plans again or type exit:"
        input = gets.strip.downcase
        if input.to_i > 0
            url =  MealPlans::Plans::URLS.values[input.to_i - 1]
            plan = MealPlans::Plans.today(url)
            # the_plans = @plans[input.to_i - 1]    
            puts "#{plan.name} - #{plan.type}"        
        elsif input == "list"
            list_plans
        else    
        puts "Not sure what you want. Please type list or exit."     
        end
        end
    end


    def goodbye
        puts "See you next time for more Plans!!!"

    end



end


        # when "1"
        #     puts "Here is a one-week meal plan to get you started!!!"
        # when "2"
        #     puts "Here is a one-week meal plan to get you started!!!"
        # when "3"
        #     puts "Here is a one-week meal plan to get you started!!!"
        # when "list"
        #     list_plans            
        # else