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
end

return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end
   # => 1
   #    2
   #    3
   #    1
   #    2
   #    3
   
   p return_value  # => [1, 2, 3]