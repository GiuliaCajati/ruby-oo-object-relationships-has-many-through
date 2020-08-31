#require 'pry'

class Waiter
    #has many customers 
    #has many meals 

    attr_accessor :name, :years_experience

    @@all = []

    def initialize (name, years_experience)
        @name = name 
        @years_experience = years_experience 
        @@all << self 
    end 

    def self.all
        @@all
    end

    def new_meal (customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals
        #returns an Array of Meal instances associated with this waiter
        Meal.all.select do |meal|
            meal.waiter == self  
    end
    end 

    def best_tipper
        #returns the Customer instance associated with the meal that received the largest tip 
        largest_tip = meals.max do |meal_1, meal_2|
        meal_1.tip <=> meal_2.tip
        # spaceship = 1, 0, or −1 depending on the value of the left
    end 
    largest_tip.customer 
    end 
    
end



#binding.pry