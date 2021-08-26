#this project is supposed to demonstrate how well I can build my own custom 
#enumerable methods from scratch

module Enumerable
    def my_each()
        counter = 0
        until counter >= self.length 
         yield self[counter]
         counter += 1
        end
        
        

    end
end

numbers = [54, 2, 3]
numbers.my_each do |value|
    puts value
end

numbers.each do |value|
    puts value
end

