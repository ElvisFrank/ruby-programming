
# Basic conditional statement
    if false
        # do something awesome...
    elsif true
        # do something awesome...
    else
        # do something awesome...
    end
              
    puts "Hot diggity damn, 1 is less than 2" if 1 < 2

# Boolean Logic
    #  == (equals)
    #  != (not equals)
    #  >
    #  <
    #  >=
    #  <=
    
    5.eql?(5.0) #=> false (checks both VALUE and TYPE)
    
    a = 5
    b = 5
    a.equal?(b) #=> true (valores iguales por optimizacion indican al mismo objeto en memoria)
    
    a = "hello"
    b = "hello"
    a.equal?(b) #=> false (en string no sucede la optimizacion y son objetos en memoria diferentes por eso no son equal)
    
    5 <=> 10    #=> -1
    10 <=> 10   #=> 0
    10 <=> 5    #=> 1

    # Logical operator
    #   !
    #   &&
    #   ||
    #   and
    #   or

#Case statements
    grade = 'F'

    did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
      when 'A' then "Hell yeah!"
      when 'D' then "Don't tell your mother."
      else "McDonald's is hiring!"
    end

    grade = 'F'

    case grade
    when 'A'
      puts "You're a genius"
      future_bank_account_balance = 5,000,000
    when 'D'
      puts "Better luck next time"
      can_i_retire_soon = false
    else
      puts "McDonald's is hiring!"
      fml = true
    end
    
  case variable
		when 0
		when 1,2,3,4,5
		when 6..9
		else
  end
  
# unless
    puts 'somethings' unless false    # if !condition

# !! == boolean
    # nil or false = falso; todo lo demas es verdadero.
    puts "nil | #{!!(nil)}"
    puts "0 | #{!!(0)}"
    puts "\"0\" | #{!!("0")}"
    puts "\"\" | #{!!("")}"
    puts "1 | #{!!(1)}"
    puts "[] | #{!!([])}"
    puts "{} and -1 | #{!!({} and -1)}"