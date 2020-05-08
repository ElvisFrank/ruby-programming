
# Creating a Method
    # You can create your own custom methods in Ruby using the following syntax:
    def my_name
      "Joe Smith"
    end
    puts my_name    #=> "Joe Smith"

 # Your method name can use numbers, capital letters, lowercase letters, and the special characteres _, ?, !, =. Separating words with underscores (_).

 # Here are some things you are not allowed to do with your method names:
    # You cannot name your method one of Ruby’s approximately 40 reserved words, such as end, while, or for. Checkout the full list here.
    # You cannot use any symbols other than _, ?, !, and =.
    # You cannot use ?, !, or = anywhere other than at the end of the name.
    # You cannot begin a method name with a number.
    # Here are some examples of valid and invalid method names:
        # method_name      # valid
        # _name_of_method  # valid
        # 1_method_name    # invalid
        # method_27        # valid
        # method?_name     # invalid
        # method_name!     # valid
        # begin            # invalid (Ruby reserved word)
        # begin_count      # valid
    # Can you tell why some of these names are invalid?
    
    # In general, short but descriptive is the name of the naming game. You want to be able to tell what a method is expected to do based on its name, so please don’t name your method do_stuff.
    
    # If your method does so many things that you feel it requires a very long name, then your method should probably be broken up into several smaller and simpler methods. Ideally, each method should do only one thing. This practice will pay dividends down the road in terms of readability, scalability, and maintainability. (It also makes testing your code a lot easier, which will be covered in a later lesson.)

# Parameters and Arguments
    def greet(name)
      "Hello, " + name + "!"
    end
    puts greet("John") #=> Hello, John!

    # Default Parameters
    def greet(name = "stranger")
      "Hello, " + name + "!"
    end
    puts greet("Jane") #=> Hello, Jane!
    puts greet #=> Hello, stranger!

# What Methods return
    def even_odd(number)
        return "A number was not entered." unless number.is_a? Numeric
        number % 2 == 0 ? "That is an even number." : "That is an odd number."
    end

    puts even_odd(20) #=>  That is an even number.
    puts even_odd("Ruby") #=>  A number was not entered.

# Chaining Methods
    phrase = ["be", "to", "not", "or", "be", "to"]
    puts phrase.reverse.join(" ").capitalize
    #=> "To be or not to be"
        # ["be", "to", "not", "or", "be", "to"].reverse
        # = ["to", "be", "or", "not", "to", "be"].join(" ")
        # = "to be or not to be".capitalize
        # = "To be or not to be"

# Predicate Methods (?) - return a BOOLEAN
    puts 5.even?  #=> false
    puts 6.even?  #=> true
    puts 17.odd?  #=> true

    puts 12.between?(10, 15)  #=> true

# Bang Methods (!)
    whisper = "HELLO EVERYBODY"
    puts whisper.downcase! #=> "hello everybody"
    puts whisper #=> "hello everybody"

# Random
	num_aleatorio = rand(10)