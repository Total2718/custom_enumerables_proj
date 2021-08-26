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

    def my_each_with_index
        counter = 0
        until counter >= self.length
            yield(self[counter] , counter)
        
            counter += 1
        end
    end
end

def space 
    10.times do
        puts "\n"
    end
end

numbers = [54, 2, 3]

#my_each comparison
numbers.my_each do |value|
    puts value
end

numbers.each do |value|
    puts value
end

puts "\n\n\n"

#my_each_with_index
numbers.my_each_with_index do |value, index|
    puts value
    puts index
    
end

puts "\n\n"

numbers.each_with_index do |value, index|
    puts value
    puts index
end





