
# https://ruby-doc.org/core-2.6.1/Enumerable.html
# imagine you don't want to invite your friend Brian

    # for
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    invited_list = []

    for friend in friends do
      invited_list.push(friend) if friend != 'Brian'
    end
    invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
    
    # with select
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

    friends.select { |friend| friend != 'Brian' }
    #=> ["Sharon", "Leo", "Leila", "Arun"]

    # with reject - sacar a 'Brian'
    friends = ['Sharon', 'Leo', 'Leila', 'Brain', 'Arun']

    friends.reject { |friend| friend == 'Brian' }
     #=> ["Sharon", "Leo", "Leila", "Arun"]

# The each method
    # .each {|value| ..}
    # .each_index {|index| .. }
    # .each_with_index {|animal, idx| ..}
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    friends.each { |friend| puts "Hello, " + friend }
    #=> Hello, Sharon
    #=> Hello, Leo
    #=> Hello, Leila
    #=> Hello, Brian
    #=> Hello, Arun
    #=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

    my_array = [1, 2]
    my_array.each do |num|
      num *= 2
      puts "The new number is #{num}."
    end    
    #=> The new number is 2.
    #=> The new number is 4.
    #=> [1, 2]

    my_hash = { "one" => 1, "two" => 2 }
    my_hash.each { |key, value| puts "#{key} is #{value}" }
    #=> one is 1
    #=> two is 2
    #=> { "one" => 1, "two" => 2}

    my_hash.each { |pair| puts "the pair is #{pair}" }
    #=> the pair is ["one", 1]
    #=> the pair is ["two", 2]
    #=> { "one" => 1, "two" => 2}

    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    friends.each { |friend| friend.upcase }
    #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

# The each_with_index Method
    # this is nearly the same as #each, but it provides some additional functionality by yield two block variables instead of one as it iterates through an array.
    fruits = ["apple", "banana", "strawberry", "pineapple"]
    fruits.each_with_index { |fruit, index| puts fruit if index.even? }
    #=> apple
    #=> strawberry
    #=> ["apple", "banana", "strawberry", "pineapple"]

# The map method
    # the map method can transform each elemente from an array according to whatever block you pass to it and returns the transformed elements in a array.
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    friends.map { |friend| friend.upcase }
    #=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

    my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
    my_order.map { |item| item.gsub('medium', 'extra large') }
    #=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]

    # Maybe you've decided that it's time for you to get your finaces in order, and you want to deduct your salray over the few months to make sure that you haven't been spendeing all of your remaining money on extra large Big Mac meals:
    salaries = [1200, 1500, 1100, 1800]
    salaries.map { |salary| salary - 700 }
    #=> [500, 800, 400, 1100]
    
    # With index:
    array = %w(a b c)
    array.map.with_index { |ch, idx| [ch, idx] }
    #=> [["a", 0], ["b", 1], ["c", 2]
    # Bonus tip: You can pass a parameter to with_index if you don’t want to start from index 0.

# The select Method - also called #filter
    # passes every item in a array to a block and returns a new array witch only the items for wich the codition ypu set in the block evaluated to TRUE.

    # using #each method:
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    invited_list = []  
    
    friends.each do |friend|
      invited_list.push(friend) if friend != 'Brian'
    end
    invited_list
    #=> ["Sharon", "Leo", "Leila", "Arun"]

    # Using our shiny new #select method:
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    friends.select { |friend| friend != 'Brian' }
    #=> ["Sharon", "Leo", "Leila", "Arun"]
    
    responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
    responses.select { |person, response| response == 'yes'}
    #=> {"Sharon"=>"yes", "Arun"=>"yes"}
# The .inject method
    # Sum some numbers
    (5..10).reduce(:+)                             #=> 45
    # Same using a block and inject
    (5..10).inject { |sum, n| sum + n }            #=> 45
    # Multiply some numbers
    (5..10).reduce(1, :*)                          #=> 151200
    # Same using a block
    (5..10).inject(1) { |product, n| product * n } #=> 151200
    # find the longest word
    longest = %w{ cat sheep bear }.inject do |memo, word|
       memo.length > word.length ? memo : word
    end
    longest                                        #=> "sheep"      
                                 
# The reduce Method - also called #inject
    # The ides is simple enough, though: it reduces an array or hash down to a single object. You should use #reduce when you want to get an output of single value

    # sum of an array of numbers using #each method:
    my_numbers = [5, 6, 7, 8]
    sum = 0
    my_numbers.each { |number| sum += number }
    sum
    #=> 26

    # Using #reduce method:
    my_numbers = [5, 6, 7, 8]  
    my_numbers.reduce { |sum, number| sum + number }  # | acumulator, item_venctor | => acumulator initial value is ZERO, and it's value return
    #=> 26
    # 1. Iteration 0: sum = 0
    # 2. Iteration 1: sum = 0 + 5 = 5
    # 3. Iteration 2: sum = 5 + 6 = 11
    # 4. Iteration 3: sum = 11 + 7 = 18
    # 5. Iteration 4: sum = 18 + 8 = 26

    # Whe can also set a different initial value for the accumulator:
    my_numbers = [5, 6, 7, 8]
    my_numbers.reduce(1000) { |sum, number| sum + number }
    #=> 1026

    votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
    my_var = votes.reduce(Hash.new(0)) do |result, vote|
      result[vote] += 1
      result
    end
    p my_var
    #=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}

# Que paso en el anterior, Hash.new(0) - DEFAULT VALUE
    hundreds = Hash.new(100)
    hundreds["first"]         #=> 100
    hundreds["mine"]          #=> 100
    hundreds["yours"]         #=> 100
    
    #Once you set the value for a key equal to something else, the default value is overwritten:
    hundreds = Hash.new(100)
    hundreds["new"]           #=> 100
    hundreds["new"] = 99
    hundreds["new"]           #=> 99

# Bang Methods (!)
    # enumerables like #map and #select return new arrays but don't modify the array that they were called on (we don't want accidently lose that information).
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    friends.map { |friend| friend.upcase }
    #=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
    friends
    #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

    # If we wanted to change our friends array instead, we caould use the bang method #map!:
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    friends.map! { |friend| friend.upcase }
    #=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
    friends
    #=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

# Return  Values of Enumerables
    # One option is to put the result of an enumerable method into a local variable:
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    invited_friends = friends.select { |friend| friend != 'Brian' }
    friends           #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']  
    invited_friends   #=> ["Sharon", "Leo", "Leila", "Arun"]

    # An even better option would be to wrap your enumerable method in a method definition:
    friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

    def invited_friends(friends)
      friends.select { |friend| friend != 'Brian' }
    end

    friends                   #=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
    invited_friends(friends)  #=> ["Sharon", "Leo", "Leila", "Arun"]

# Others Enumerables Methods
    # collect (same #map) - will run your block and give you an object filled with whatever your block returned each time. Ruby says:
    [2,4,6,8,100].collect{|num| num**2 }
    #=> [4,16,36,64,10000]

    #inject (aka #reduce) Can set initial value for the ACUMULATOR and return the value of last iteration:
    [2,4,6,8,100].inject(0){|running_total, item| running_total + item }
    #=> 120

 # Use inject to convert an array into a hash:
    #old
    data_arr = [['dog', 'Fido'], ['cat', 'Whiskers'], ['fish', 'Fluffy']]

    data_hash = {}
    data_arr.each do |d|
        data_hash[d[0]] = d[1]
    end

    # Now do the same using inject.
    # Solution
    data_arr = [['dog', 'Fido'], ['cat', 'Whiskers'], ['fish', 'Fluffy']]
    data_hash = data_arr.inject({}) do |hsh, v|
        hsh[v[0]] = v[1]
        hsh
    end

 # Enumerable is a large bunch of methods and you'll only use a half-dozen of them regularly but there are some others that you should be familiar with as well. The full list is available in the docs here.
    #any?   : Returns true/false (see the question mark?) and answers the question, "do ANY of the elements in this object pass the test in my block?". If your block returns true on any time it runs, any? will return true.
    #all?   : Returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?". Every time the block runs it must return true for this method to return true.
    #none?  : Returns true only if NONE of the elements in the object return true when the block is run.
    #find   : Returns the first item in your object for which the block returns true.
    # [1, 2, 3].find { |v| v.even?} #=> 2
 # Awesome but less common methods
    #group_by will run your block and return a hash that groups all the different types of returns from that block. For example:
    names = ["James", "Bob", "Joe", "Mark", "Jim", "Lujian"]
    names.group_by{|name| name.length}
    #=> {5=>["James"], 3=>["Bob", "Joe", "Jim"], 4=>["Mark"]} 

    #grep returns an array with those items that actualy match the specified criteria (RegEx) (using a === match)
    print names.grep(/J/i)
    #=> ["James", "Joe", "Jim"]

 # Some of the methods you've already seen and use are part of Enumerable too -- #include?, #sort, #count etc.
 
 # When you use the Enumerable methods, you'll sometimes see what's called an enumerator object pop up, usually if you forget to give them a parameter that they want like a block. What the heck is that?

 # Consider it an implementation detail of Enumerator. As we said before, the methods that are part of Enumerable rely on the underlying collections' #each method to work. enumerable is basically a go-between for the original collection and Enumerator. It's not really something you'll be using right off the bat but it's useful for gaining a better understanding of Enumerable.


# Ruby Hash#sort_by
    # Ruby#sort and #sort_by methods are powerful: We can easily arrange the result we want, such as sort the names by alphabetical order or the name’s length. Surprisingly, there are not many examples in Ruby document library for this useful tool. Therefore, I would like to explore some use cases of #sort_by and #sort, specifically for Hash.
 
 # sort will return a new array
    # First thing to note that #sort/#sort_by will return a new array. Suppose we have a hash:
    hash = {a:1, b:2, c:4, d:3, e:2}
    hash.sort
    #=> [[:a, 1], [:b, 2], [:c, 4], [:d, 3], [:e, 2]]
    # Therefore, if we want to return the sorted hash in hash format, we need to call #to_h after #sort.
 
 # Sort by Hash values in ascending and descending order
    # So what if we want to sort by hash values instead of the key’s order? Here comes the #sort_by method:
    hash.sort_by {|k, v| v}
    #=> [[:a, 1], [:b, 2], [:e, 2], [:d, 3], [:c, 4]]
    # By default, Ruby returns the value in ascending order. If we want Ruby to return the value in descending order without using #reverse method, we can do this:
    hash.sort_by {|k, v| -v}
    #=> [[:c, 4], [:d, 3], [:b, 2], [:e, 2], [:a, 1]]
 
 # Sort by Hash values and keys at the same time
    # Finally, suppose we have a long list of hash like below:
    hash = {“w”=>2, “k”=>1, “l”=>2, “v”=>5, “d”=>2, “h”=>4, “f”=>1, “u”=>1, “p”=>1, “j”=>1}
    # With this hash, we want to do two things. First, sort the hash by the values in descending order . Then, sort it by letter’s alphabetical order. We can easily achieved this as below:
    hash.sort_by {|k, v| [-v, k]}
    #=> [[“v”, 5], [“h”, 4], [“d”, 2], [“l”, 2], [“w”, 2], [“f”, 1], [“j”, 1], [“k”, 1], [“p”, 1], [“u”, 1]]
    