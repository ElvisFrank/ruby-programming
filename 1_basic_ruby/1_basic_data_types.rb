# Keywords:
	#   alias   and     BEGIN   begin   break   case    class   def     defined
	#   do      else    elsif   END     end     ensure  false   for     if
	#   in      module  next    nil     not     or      redo    rescue  retry
	#   return  self    super   then    true    undef   unless  until   when
	#   while   yield

# Operators
    # Addition
    p 1 + 1   #=> 2
    # Subtraction
    p 2 - 1   #=> 1
    # Multiplication
    p 2 * 2   #=> 4
    # Division
    p 10 / 5  #=> 2
    # Exponent
    p 2 ** 2  #=> 4
    p 3 ** 4  #=> 81
    # Modulus (find the remainder of division)
    p 8 % 2   #=> 0  (8 / 2 = 4; no remainder)
    p 10 % 4  #=> 2  (10 / 4 = 2 with a remainder of 2)
    # integer and float
    p 17 / 5    #=> 3, not 3.4
    p 17 / 5.0  #=> 3.4

# Numbers
    12_000_000_000
    3.1415
    12.043e-04
    # To convert an integer to a float:
    p 13.to_f   #=> 13.0

    # To convert a float to an integer:
    p 13.0.to_i #=> 13
    p 13.9.to_i #=> 13

    #even?  PAR
    p 6.even? #=> true
    p 7.even? #=> false

    #odd?   IMPAR
    p 6.odd? #=> false
    p 7.odd? #=> true

# string concat
    # With the plus operator:
    "Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

    # With the shovel operator:
    "Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

    # With the concat method:
    "Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"
# Substrings
    "hello"[0]      #=> "h"
    "hello"[0..1]   #=> "he"
    "hello"[0, 4]   #=> "hell"
    "hello"[-1]     #=> "o"

# Escape characters
    #  \\     #=> Need a backslash in your string?
    #  \b     #=> Backspace
    #  \r     #=> Carriage return, for those of you that love typewriters
    #  \n     #=> Newline. You'll likely use this one the most.
    #  \s     #=> Space
    #  \t     #=> Tab
    #  \"     #=> Double quotation mark
    #  \'     #=> Single quotation mark
# interpolation
    name = "Odin"
    puts "Hello, #{name}" #=> "Hello, Odin"
    puts 'Hello, #{name}' #=> "Hello, #{name}"
# Common String Methods
    #capitalize
    "hello".capitalize #=> "Hello"
    
    #include?
    "hello".include?("lo")  #=> true
    "hello".include?("z")   #=> false
    
    #upcase
    "hello".upcase  #=> "HELLO"
    
    #downcase
    "Hello".downcase  #=> "hello"
    
    #empty?
    "hello".empty?  #=> false
    "".empty?       #=> true
    
    #length
    "hello".length  #=> 5
    
    #reverse
    "hello".reverse  #=> "olleh"
    
    #split
    "hello world".split  #=> ["hello", "world"]
    "hello".split("")    #=> ["h", "e", "l", "l", "o"]
    
    #strip
    " hello, world   ".strip  #=> "hello, world"

    # You’ll read more about these methods and others in the assignment. The examples below are just to get your creative juices flowing with some of the awesome ways you can modify strings.
    "he77o".sub("7", "l")           #=> "hel7o"
    "he77o".gsub("7", "l")          #=> "hello"
    "hello".insert(-1, " dude")     #=> "hello dude"
    "hello".split("")               #=> ["h", "e", "l", "l", "o"]
    "!".prepend("hello, ", "world") #=> "hello, world!"

    # The assignments will go much deeper, so go through them thoroughly and be sure to play around in a REPL as you read.
    # Converting other objects to strings
    # Using the to_s method, you can convert pretty much anything to a string. Here are some examples:
    5.to_s        #=> "5"
    nil.to_s      #=> ""
    :symbol.to_s  #=> "symbol"

# Symbols
    :my_symbol
    
    # Symbols vs. Strings
    # To get a better idea of how symbols are stored in memory, give this a whirl in irb or a REPL. The #object_id method returns an integer identifier for an object. (And remember:     in Ruby, everything is an object!)

    "string" == "string"  #=> true
    "string".object_id == "string".object_id  #=> false
    :symbol.object_id == :symbol.object_id    #=> true

# Booleans
    false   # false or nil
    true    # all else
    
# constantes:
	# Van en mayuscula, es una referencia Inmutable a un objeto.
	# Se pueden definir Externamente, dentro de una clase o modulo (No dentro de metodos)
	# Se pueden usar fuera de clase o módulo con: ClaseName::CONSTANTE_NAME
	# Las definidas fuera de clase o módulo se usan con ::CONSTANTE_NAME
	CONST_EXTERNA = 99
	class Const
		CONST = CONST_EXTERNA + 1
		def get_const
	    	CONST
		end
	end
	puts Const.new.get_const	# 100
	puts Const::CONST			# constante dentro de la clase Const 
	puts ::CONST_EXTERNA		# constante externa a toda clase 
	puts Const::NEW_CONST = 123	# Se puede crear constantes externamente para una clase.
