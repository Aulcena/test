require "byebug"
class Array
    def my_each(&blk) #this needs to take in the block
        #lets iterate through self, the array
        #for each, element we need to call the block
        #after iteration, return original array
        i = 0

        while i < self.length

            blk.call(self[i])

            i += 1
        end
        self
    end


    # we dont have access to each element
    # def my_select(&blk)

    #     array = []
        
    #     if self.my_each.with_index do |&blk|

    #         array << self[i]
    #         end
    #     end

    #     return array

    # end

    def my_select(&blk)
        #why does num correspond to self[i]?
        arr = []
        self.my_each do |num|

            arr << num if blk.call(num)

        end

        arr

    end

    def my_reject(&blk)

        arr = []
        self.my_each do |num|

            arr << num if !blk.call(num)

        end

        arr

    end

    def my_any?(&blk)
        #why does num correspond to self[i]?
        
        self.my_each do |num|

             return true if blk.call(num)

        end

        false
    end

    
    # increment count if proc retursn true
    # if count == self.length  return true. else false

    
    def my_all?(&blk)
        #why does num correspond to self[i]?
        count = 0
        self.my_each do |num|

             count += 1 if blk.call(num)

        end
        
        return true if count == self.length

        false

    end

    #find base case
    #inductive step
    # if not array take data return [data]
    #stack tracing
    # recursion uses same method within method
    # we are iterating as well, Array.each
    # iteration we are flattening ele if it is an array, adding it to empty array
    #if element in an array is not an array, shovel it into the flattened_array
    #embed base case inside of an if else statement inside of a .each
    #concatenate to flattened array and call my_flatten
    def my_flatten(self)

        flattened_array = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened_array += my_flatten(ele) 
            else
                [ele]
            end
        end
    end

    # base case = [1,2,3]
# flatten = [1, [2,[3]]]
#my_flatten(flatten) # [1,2,3]



end


# use my each method 
# takes a block
# returns a  new array containing that only satisfies the blaock


# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]



# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# p "-------------------------------------------"


# a = [1, 2, 3]
# # p a.my_any? { |num| num > 1 } # => true
# # p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

    # base case = [1,2,3]
flatten = [1, [2,[3]]]
p my_flatten(flatten) # [1,2,3]