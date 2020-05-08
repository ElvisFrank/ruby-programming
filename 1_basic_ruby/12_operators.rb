a = 10
b = 20
# 1 Ruby Comparison Operators
    # Operator	Description / Example
    # ==        Checks if the value of two operands are equal or not, if yes then condition becomes true.
    (a == b)#is not true.
    # !=        Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.
    (a != b)#is true.
    # >         Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.
    (a > b)#is not true.
    # <         Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.
    (a < b)#is true.
    # >=        Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.
    (a >= b)#is not true.
    # <=        Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.
    (a <= b)#is true.
    # <=>       Combined comparison operator. Returns 0 if first operand equals second, 1 if first operand is greater than the second and -1 if first operand is less than the second.
    (a <=> b)#returns -1.
    # ===       Used to test equality within a when clause of a case statement.
    (1...10) === 5#returns true.
    # .eql?     True if the receiver and argument have both the same type and equal values.
    1 == 1.0#returns true, but
    1.eql?(1.0)#is false.
    # equal?    True if the receiver and argument have the same object id.
    a.equal? b #is false. If aObj is duplicate of bObj then aObj == bObj is true. Or a.equal?aObj is true.

# 2 Ruby Arithmetic Operators
    # Operator	Description	        Example
    # +     	Addition:       a + b will give 30
    # −     	Subtraction:    a - b will give -10
    # *     	Multiplication: a * b will give 200
    # /     	Division:       b / a will give 2
    # %     	Modulus:        b % a will give 0
    # **       	Exponent:       a**b will give 10 to the power 20

# 3 Assignment Operators (==, +=, ||=)
    # Operator	Description	Example
    # =	        Simple assignment operator, assigns values from right side operands to left side operand.
    c =a+b #will assign the value of a + b into c
    # +=	    Add AND assignment operator, adds right operand to the left operand and assign the result to left operand.
    c += a #is equivalent to c = c + a
    # -=	    Subtract AND assignment operator, subtracts right operand from the left operand and assign the result to left operand.
    c -= a #is equivalent to c = c - a
    # *=	    Multiply AND assignment operator, multiplies right operand with the left operand and assign the result to left operand.
    c *= a #is equivalent to c = c * a
    # /=	    Divide AND assignment operator, divides left operand with the right operand and assign the result to left operand.
    c /= a #is equivalent to c = c / a
    # %=	    Modulus AND assignment operator, takes modulus using two operands and assign the result to left operand.
    c %= a #is equivalent to c = c % a
    # **=	    Exponent AND assignment operator, performs exponential (power) calculation on operators and assign value to the left operand.
    c **=a #is equivalent to c = c ** a
    a ||= 100   # If 'a' doesn't exist or if it's false or nil then assign 100 to it.
                # Otherwise just return the value of 'a'
    (defined?(a) && a) ? a : a = 100    # equivalent

# 4 Ruby Parallel Assiggnment
    a = 10
    b = 20
    c = 30

    #This may be more quickly declared using parallel assignment −
    a, b, c = 10, 20, 30
    
    #Parallel assignment is also useful for swapping the values held in two variables −
    a, b = b, c
    a, b = [60, 13]

# 5 Ruby Bitwise Operators
    # Bitwise operator works on bits and performs bit by bit operation.
    # Assume if a = 60; and b = 13; now in binary format they will be as follows

     a    # =  0011 1100    60
     b    # =  0000 1101    13
     # ------------------
     a&b  # =  0000 1100    12
     a|b  # =  0011 1101    61
     a^b  # =  0011 0001    49
     ~a   # =  1100 0011    -61
     puts ~-1, ~0, ~1            # 0 -1  -2

    # Operator      Description	Example
    # & 	Binary AND Operator copies a bit to the result if it exists in both operands.
    (a & b)#will give 12, which is 0000 1100
    # | 	Binary OR Operator copies a bit if it exists in either operand.
    (a | b)#will give 61, which is 0011 1101
    # ^ 	Binary XOR Operator copies the bit if it is set in one operand but not both.
    (a ^ b)#will give 49, which is 0011 0001
    # ~ 	Binary Ones Complement Operator is unary and has the effect of 'flipping' bits.
    (~a )  #will give -61, which is 1100 0011 in 2's complement form due to a signed binary number.
    # <<    Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand.
    a << 2 #will give 240, which is 1111 0000
    # >>    Binary Right Shift Operator. The left operands value is moved right by the number of bits specified by the right operand.
    a >> 2 #will give 15, which is 0000 1111

# 6 Ruby Logical Operators
    # The following logical operators are supported by Ruby language
    a, b = 10, 20

    # Operator	    Description	Example
    # and	    Called Logical AND operator. If both the operands are true, then the condition becomes true.
    (a and b)#is true.
    # or	    Called Logical OR Operator. If any of the two operands are non zero, then the condition becomes true.
    (a or b) #is true.
    # &&	    Called Logical AND operator. If both the operands are non zero, then the condition becomes true.
    (a && b) #is true.
    # ||	    Called Logical OR Operator. If any of the two operands are non zero, then the condition becomes true.
    (a || b) #is true.
    # !	        Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true, then Logical NOT operator will make false.
    !(a && b) #is false.
    # not	    Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true, then Logical NOT operator will make false.
    not(a && b) #is false.

# 7 Ruby Ternary Operator
    # condicion ? case_true : case_false
    "".size == 0 ? "Empty string" : "Non-empty string"   # Can contained methods 

# 8 Ruby Range Operators
    # Operator	Description	Example
    # ..	    Creates a range from start point to end point inclusive.
    1..10  #Creates a range from 1 to 10 inclusive.
    # ...	    Creates a range from start point to end point exclusive.
    1...10 #Creates a range from 1 to 9.

# 9 Ruby defined? Operators
    # defined? is a special operator that takes the form of a method call to determine whether or not the passed expression is defined.
    # It returns a description string of the expression, or nil if the expression isn't defined.
    
    # Usage 1: defined? variable # True if variable is initialized
    foo = 42
    defined? foo    # => "local-variable"
    defined? $_     # => "global-variable"
    defined? bar    # => nil (undefined)
    
    # Usage 2: # defined? method_call # True if a method is defined
    defined? puts        # => "method"
    defined? puts(bar)   # => nil (bar is not defined here)
    defined? unpack      # => nil (not defined here)
    
    # Usage 3: # True if a method exists that can be called with super user
    defined? super     # => "super" (if it can be called)
    defined? super     # => nil (if it cannot be)
    
    # Usage 4: # defined? yield   # True if a code block has been passed
    defined? yield    # => "yield" (if there is a block passed)
    defined? yield    # => nil (if there is no block)

# 10 Ruby Dot "." and Double Colon "::" Operators
    MR_COUNT = 0         # constant defined on main Object class
    module Foo
       MR_COUNT = 0
       ::MR_COUNT = 1    # set global count to 1
       MR_COUNT = 2      # set local count to 2
    end
    puts MR_COUNT        # this is the global constant
    puts Foo::MR_COUNT   # this is the local "Foo" constant

    # Other example
    CONST = ' out there'
    class Inside_one
       CONST = proc {' in there'}
       def where_is_my_CONST
          ::CONST + ' inside one'
       end
    end
    class Inside_two
       CONST = ' inside two'
       def where_is_my_CONST
          CONST
       end
    end
    puts Inside_one.new.where_is_my_CONST   # out there inside one
    puts Inside_two.new.where_is_my_CONST   # inside two
    puts Object::CONST + Inside_two::CONST  # out there inside two
    puts Inside_two::CONST + CONST          # inside two out there
    puts Inside_one::CONST                  # #<Proc:0x0000511115>
    puts Inside_one::CONST.call + Inside_two::CONST # in there inside two

# 11 Ruby Operators Precedence
    # The following table lists all operators from highest precedence to lowest.

    # Method	    Operator	Description
    # Yes	    ::          Constant resolution operator
    # Yes	    [ ] [ ]=    Element reference, element set
    # Yes	    **	        Exponentiation (raise to the power)
    # Yes	    ! ~ + -     Not, complement, unary plus and minus (method names for the last two are +@ and -@)
    # Yes	    * / %       Multiply, divide, and modulo
    # Yes	    + -         Addition and subtraction
    # Yes	    >> <<	    Right and left bitwise shift
    # Yes	    &	        Bitwise 'AND'
    # Yes	    ^ |	        Bitwise exclusive `OR' and regular `OR'
    # Yes	    <= < > >=   Comparison operators
    # Yes	    <=> == === != =~ !~
                            # Equality and pattern match operators (!= and !~ may not be defined as methods)
    #  	        &&	        Logical 'AND'
    #  	        ||	        Logical 'OR'
    #  	        .. ...	    Range (inclusive and exclusive)
    #  	        ? :	        Ternary if-then-else
    #  	        = %= { /= -= += |= &= >>= <<= *= &&= ||= **=
                            # Assignment
    #  	        defined?	Check if specified symbol defined
    #  	        not	        Logical negation
    #  	        or and	    Logical composition
    # NOTE − Operators with a Yes in the method column are actually methods, and as such may be overridden.

# 12 What Are Unary Operators?
    !!123   # true
    !!nil   # false
    !true   # false
    !!true  # true
    !false  # true

# 13 Ruby Splat Operator (With Examples)
    # The splat operator (*) is interesting because it does something you can’t do without it.
    # Let’s say you have an array like this:
    attributes = [:title, :author, :category]
    
    # And you want to use this array with a method that takes variable arguments, like attr_reader.
    # Then you could do this:
    attr_reader *attributes

    # The splat operator converts the array into a list of its elements. So it would be like taking away the array & replacing it with everything inside it.
    # In other words, the last example translates to:
    attr_reader :title, :author, :category
    
    # That’s the power of the splat operator 🙂

# 14 Matching Operator (=~)
    # It allows you to do a quick index search using a regular expression.
    # Here’s an example:
    "3oranges" =~ /[0-9]/   # 0
    
    # This looks for numbers & returns the index inside the string where the first match is found, otherwise it returns nil.
    # In addition, you have the !~ operator, which is the “NOT match” operator.
    # Example:
    "abc" !~ /[0-9]/        # false
    
    # You’ll get 'true' or 'false' with this, no indexes, so keep that in mind.

# 15 The Shovel / Push Operator (<<)
    animals = []
    animals << "cat"
    
    # With strings it will append to the end:
    "" << "cat"

    # And with Integers, it will do a "left shift", which is rotating all the bits to the left.
    2 << 1  # 4
    2 << 2  # 8
    2 << 3  # 16

# 16 The Safe Navigator Operator (&.)
    # You may want to call a method on an object, but this object may be nil, which is no good because calling a method on nil often results in an error.
    # One solution:
    if user && user.active
    end
    
    # A better way to do this:
    if user&.active
      # ...
    end
    
    # This &. is the safe navigator operator (introduced in Ruby 2.3), which only calls the active method on user if it's not nil.
    # Very useful!

    