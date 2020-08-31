#require 'pry'

class Customer
    #has one waiter 
    #has one meal 
    attr_accessor :name, :age 

    @@all = []

    def initialize (name, age)
        @name = name 
        @age = age 
        @@all << self 
    end 

    def self.all 
        @@all 
    end

    def meals 
        #returns an Array of Meal instances associated with this customer 
        Meal.all.select do |meal| #scan meal array 
            meal.customer == self #
        end 
    end 

    def new_meal (waiter, total, tip)
        #initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
        Meal.new(waiter, self, total, tip)   
    end 
   
    def waiters
        #returns an Array of Waiter instances associated with this customer's meals
        meals.map do |meal| 
            meal.waiter
        end 
    end 

end

#binding.pry