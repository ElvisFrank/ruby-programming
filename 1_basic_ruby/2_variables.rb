
# Variables are pointers to physical space in memory.
# Declarin a variables
    age = 18        #=> 18
    age = age + 4   #=> 22
    age += 6        #=> 30
    age -= 10       #=> 20
    age *= 3        #=> 60
    age /= 6        #=> 10

    # Lowercase and should be split by an underscore
    snake_case = nil

    # Variables are references
    desired_location = "Barcelona"      #=> "Barcelona"
    johns_location = desired_location   #=> "Barcelona"
    
    # Now, if we modify the string that johns_location is pointing to, desired_location will also reflect that change:
    johns_location.upcase!  #=> "BARCELONA" # muta el valor pero no cambia de referencia (jhons_location and desire_location) siguen referiendo a la misma ubicación en memoria.
    puts desired_location        #=> "BARCELONA"
    puts johns_location          #=> "BARCELONA"

    #http://rubytutorial.wikidot.com/introduccion
# Variables: Contienen cualquier tipo de dato. El propio nombre de la variable, muestra su alcance (local, global,…):
 #- Local: Consiste en letras minúsculas o guión bajo.
    sunil ,_z, rock_and_roll = nil
 #- Instance: Used to define the attributes of something (MyClass).
    # (De un objeto) Empieza con la arroba, separado por guión bajo.
    @sign, @_, @x, @y, @only_the_chunkiest_cut_of_bacon_I_have_ever_seen = nil
 #- Class: Too, are used to define attributes. But, they are attributes for everything MyClass class.
    # Empieza con dos arrobas seguido por cualquier mayúscula o minúscula.
    @@signo; @@_; @@Counter
 #- Global: Se pueden usar en cualquier parte del programa, Nunca se pierden de vista.
    # Empieza por el signo dólar, seguido por cualquier carácter(no sólo mayúsculas o minúsculas).
    $counter, $COUNTER, $-x = nil
