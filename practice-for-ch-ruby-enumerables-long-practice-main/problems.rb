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
        self.my_each.with_index do |num|

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
end


# use my each method 
# takes a block
# returns a  new array containing that only satisfies the blaock


a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]



a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []


p "-------------------------------------------"


