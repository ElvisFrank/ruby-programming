# Reading the Stack Trace
    # First, look the terminal in lib/my_file.rb:18:in '....

# Debugging with puts

# Debugging with Pry
    # Pry is a Ruby gem that provides you with an interactive REPL while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality.
    #
    # https://github.com/pry/pry/wiki
    
# Exceptions & Stack Traces
    # StandardError
    # TypeError
    # ArgumentError
    # NoMethodError
    # RuntimeError
    # SystemCallError
    # ZeroDivisionError
    # RegexpError
    # IOError
    # EOFError
    # ThreadError
    # ScriptError
    # SyntaxError
    # LoadError
    # NotImplementedError
    # SecurityError

# How to Start Debugging
    # Programs generally go wrong due to two main reasons:
        # The program encounters an error and won’t run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace.
        # The program runs but does not work the way you expect. For example, you expect a method to return a 2, but it actually returns 6 when you run it. In this case, there is no stack trace.
     
    # Obviously, if available, the stack trace is the first place you should look when debugging. If there’s no stack trace, then puts and Pry are the easiest and quickest tools you can use to get yourself back up and running.

# pry
require 'pry'
def prying_into_the_method
    inside_the_method = "We're inside the method"
    puts inside_the_method
    puts "We're about to stop because of pry!"
    binding.pry
    this_variable_hasnt_been_interpreted_yet = "The program froze before it could read me!" 
    puts this_variable_hasnt_been_interpreted_yet
end
prying_into_the_method

# Here we are requiring pry, which you must do to use pry, defining a method, and then calling that method.
# 
#     In the directory of this repo, in your terminal, run the file by typing ruby lib/pry_is_awesome.rb. Now, look at your terminal. You should see something like this:
#       3: def prying_into_the_method
#          4:     inside_the_method = "We're inside the method"
#          5:     puts inside_the_method
#          6:     puts "We're about to stop because of pry!"
#      =>  7:     binding.pry
#          8:     this_variable_hasnt_been_interpreted_yet = "The program froze before it could read me!" 
#          9:     puts this_variable_hasnt_been_interpreted_yet
#         10: end
#     [1] pry(main)> 
#    You have frozen your program as it executes and are now inside a REPL inside your program. You basically just stopped time! How cool is that?
#    
#    In the terminal, in your pry console, type the variable name inside_the_method and hit enter. You should see a return value of "We're inside the method"
#    You are actually able to explore and manipulate the data inside the method in which you've placed your binding.
#    
#    Now, in the terminal, in your pry console, type the variable name this_variable_hasnt_been_interpreted_yet. You should see a return value of nil. That's because the binding you placed on line 7 actually froze the program on line 7 and the variable you just called hasn't been interpreted yet. Consequently, our REPL doesn't know about it. Now, in the terminal, type exit, and you'll leave your pry console and the program will continue to execute.

# Logging 101
    # Logging is a more structured approach to debugging, suitable for use in production environments and more complex applications. It neatly separates the what [to debug] from the how [to display the debugging output].
    # 
    # Rails and Sinatra will configure a logger for you automatically. For scripting or command line programs you can configure your own logger instance like this:
    require 'logger'
    logger = Logger.new(STDOUT)

    # To use the logger, call the #info method with the message/object you want to debug. So from a Rails controller or Sinatra action you might end up with something like this:
    logger.info "user #{user.id} did something interesting!"
    #
    # Unlike puts debugging, logging statements are intended to be present in production code—the logger(s) in your production environment can be configured to show different levels of detail and exactly where to send the logging output.