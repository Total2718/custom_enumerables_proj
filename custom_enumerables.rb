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

    def my_select
        new_array = []
        counter = 0
        until counter >= self.length
            if yield(self[counter]) == true
                new_array.append(self[counter])
            end
        
            counter += 1
        end
        return new_array
    end

    def my_all?
        counter = 0
        true_counter = 0
        until counter >= self.length 
         if yield(self[counter]) == true
            true_counter += 1
         end
         counter += 1
         if counter != true_counter
            break
         end
        end
        if counter != true_counter
            return false
        else 
            return true
        end
        
    end

    def my_any?
        counter = 0
        until counter >= self.length 
         if yield(self[counter]) == true
            return true
         end
         counter += 1
        end
        return false
        
    end
    
    def my_none?
        counter = 0
        false_counter = 0
        until counter >= self.length 
         if yield(self[counter]) == false
            false_counter += 1
         end
         counter += 1
         if counter != false_counter
            break
         end
        end
        if counter != false_counter
            return false
        else 
            return true
        end

    end

    def my_count(value=nil)
        counter = 0
        true_counter = 0
        
        if block_given? 
            until counter >= self.length
                
                if yield(self[counter]) == true
                    true_counter += 1
                    
                end
                counter += 1
            end
            return true_counter
        elsif value != nil 
            until counter >= self.length
                if self[counter] == value
                    true_counter += 1
                end
                return  true_counter
            end
        elsif value == nil
            return self.length
        
            
        end
        
        

    end
    
end



numbers = [54, 3, 4]

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

puts "\n\n\n"

#my_select
new_array = numbers.my_select {|value| value.even?}

new_array2 = numbers.select {|value| value.even?}

puts new_array
puts new_array2

puts "\n\n\n"

#my_all enumerator
test = numbers.my_all? {|number| number.even?}
puts test
test2 = numbers.all? { |number| number.even?}
puts test2

puts "\n\n\n"



test1 = numbers.my_any? {|number| number.odd?}
puts test1
test2 = numbers.any? {|number| number.odd?}
puts test2

puts "\n\n\n"



test1 = numbers.my_none? {|number| number.odd?}
puts test1
test2 = numbers.none? {|number| number.odd?}
puts test2

puts "\n\n\n"
puts "------------LOOK HERE-----------------"

test1 =  numbers.my_count(54)
puts test1
test2 = numbers.count(54)
puts test2