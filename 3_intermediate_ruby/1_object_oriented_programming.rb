
# https://github.com/rubocop-hq/ruby-style-guide
# https://github.com/alemohamad/ruby-style-guide/blob/master/README-esLA.md

# bloques:
	  5.times {} 	    # para una linea
    5.times do |cont|
      # ...
    end             # para mas de una.
  
# class
    p 1.class
    p 1.class.superclass
    p 1.class.superclass.superclass
    p 1.class.superclass.superclass.superclass
    p 1.class.superclass.superclass.superclass.superclass
    # Integer
    # Numeric
    # Object
    # BasicObject
    # nil

# Modules
    module Speak
        def speak(sound)
          puts sound
        end
    end

    class GoodDog
        include Speak
    end

    class HumanBeing
        include Speak
    end

    sparky = GoodDog.new
    sparky.speak("Arf!")        # => Arf!
    bob = HumanBeing.new
    bob.speak("Hello!")         # => Hello!

# Method Lookup
    puts "---GoodDog ancestors---"
    puts GoodDog.ancestors
    puts ''
    puts "---HumanBeing ancestors---"
    puts HumanBeing.ancestors

# Initialize a New Object
    class GoodDog
      def initialize
        puts "This object was initialized!"
      end
    end

    sparky = GoodDog.new        # => "This object was initialized!"

# Instance Variables
    class GoodDog
      def initialize(name)
        @name = name
      end
    end

    sparky = GoodDog.new("Sparky")

# Instance Methods
    class GoodDog
      def initialize(name)
        @name = name
      end

      def speak
        "#{@name} says arf!"
      end
    end

    sparky = GoodDog.new("Sparky")
    puts sparky.speak           # => "Sparky says arf!"
    
# Accessor Methods
    class Persona
        attr_accessor :dni  # gets and set
        attr_reader :edad   # gets
        attr_writer :name   # sets

# Class Variables
        @@number_of_persons = 0
# Costants
        NATIONALITY = 'peruvian'
        def initialize name, edad, dni
            self.name = name
            @edad = edad
            self.dni = dni
            @@number_of_persons += 1
        end

    # self.attributo        # attr_accesor and attr_read
    # self.attributo =      # attr_accesor and attr_writer
    # self.my_method        # Metodo de clase not private
        def hola
            puts "#{self.hi} I'm #{NATIONALITY}, my name is #{@name}, I'm #{self.edad.to_s} years old and my DNI is #{self.dni}"
        end
    # Uso en la misma clase o instancia de esta
        def hi
            "Aloha"
        end
    # para usar solo fuera de clase asi: Persona.persons_registred
        def self.persons_registred
            "We have #{@@number_of_persons.to_s} persons registred already"
        end
    end

    Persona.new("Frank", 34, "55486542").hola
    p Persona.persons_registred
    Persona.new("Marlen", 25, "86555442").hola
    Persona.new("Hana", 1, "54865542").hola
    Persona.new("Sofia", 5, "65425548").hola
    p Persona.persons_registred

# Class Inheritance - Herencia
    class Animal
      def speak
        "Hello!"
      end
    end

    class GoodDogInherit < Animal
        attr_accessor :name

        def initialize(n)
          self.name = n
        end
        # We can redefine some methods of the father class
        def speak
          "#{self.name} says arf!"
        end
    end

    class CatInherit < Animal
    end

    sparky = GoodDogInherit.new("Sparky")
    paws = CatInherit.new

    puts sparky.speak           # => Sparky says arf!
    puts paws.speak             # => Hello!

# Super
    class AnimalSuper
        def speak
          "Hello!"
        end
    end
    class GoodDogSuper < AnimalSuper
        def speak
          super + " from GoodDogSuper class"
        end
    end
    sparky = GoodDogSuper.new
    sparky.speak        # => "Hello! from GoodDog class"

    class AnimalSuperB
        attr_accessor :name
        def initialize(name)
          @name = name
        end
    end
    class GoodDogSuperB < AnimalSuperB
        def initialize(color)
          super
          @color = color
        end
    end
    bruno = GoodDogSuperB.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">

    class AnimalSuperC
        attr_accessor :name
        def initialize(name)
          @name = name
        end
    end
    class GoodDogSuperC < AnimalSuperC
        def initialize(color)
          super
          @color = color
        end
    end
    bruno = GoodDogSuperC.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">

# Mixing in Modules
    #-Son como clases (métodos, constantes, otros modulos y definiciones)
	  #-pero no se pueden crear clases derivadas de los modulos.
    module SwimmableMix
      def swim
        "I'm swimming!"
      end
    end
    class AnimalMix; end
    class FishMix < AnimalMix; include SwimmableMix; end         # mixing in Swimmable module
    class MammalMix < AnimalMix; end
    class CatMix < MammalMix; end
    class DogMix < MammalMix; include SwimmableMix; end         # mixing in Swimmable module
    
    sparky = DogMix.new
    neemo  = FishMix.new
    paws   = CatMix.new
    
    p sparky.swim                 # => I'm swimming!
    p neemo.swim                  # => I'm swimming!
    #paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>

# Method Lookup Path
    module WalkableLP
      def walk; "I'm walking."; end
    end
    module SwimmableLP
      def swim; "I'm swimming."; end
    end
    module ClimbableLP
      def climb; "I'm climbing."; end
    end
    class AnimalLP
      include WalkableLP
      def speak; "I'm an animal, and I speak!"; end
    end
    puts "---AnimalLP method lookup---"
    puts AnimalLP.ancestors
    # ---AnimalLP method lookup---
    # AnimalLP
    # WalkableLP
    # Object
    # Kernel
    # BasicObject
    fido = AnimalLP.new
    fido.speak                  # => I'm an animal, and I speak!

# More Modules
    module MammalMoreM
      class Dog
        def speak(sound)
          p "#{sound}"
        end
      end
      class Cat
        def say_name(name)
          p "#{name}"
        end
      end
    end
    # We call classes in a module by appending the class name to the module name with two colons(::)
    buddy = MammalMoreM::Dog.new
    kitty = MammalMoreM::Cat.new
    buddy.speak('Arf!')           # => "Arf!"
    kitty.say_name('kitty')       # => "kitty"

# Modificando clases:
    # Las clases (creadas y las de interprete) se pueden agregar mas metodos (def)
    require 'moto'
    my_moto = Moto.new('Yamaha', 'rojo')
    my_moto.arrancar
  
    class Moto
      def informe_moto
        puts "Color: #{@color}, marca: #{@marca}"
      end
    end
  
    my_moto.informe_moto

# Other - sobre escribir methodos por error
    class Child
      # other methods omitted
        def instance_of?
        p "I am a fake instance"
      end
    end
    heir = Child.new
    heir.instance_of?

# yield:
    # Para usar un bloque dentro de un metodo.
    def my_method	
      puts 'Start'					
      yield							
      puts 'End'                      # Start
    end									              # In the block
    my_method {puts 'In the block'}		# End
  
    def method
      yield('hola', 99)
    end									# hola, 99
    method {|str, num| puts "#{str}, #{num}"}

# lambda:
    # se usan para definir procedimientos, pueden tener argumentos.
    prc = lambda {puts 'Hola'}
    hello = lambda do |str|
      puts "Hi #{str}"
    end
  
    hello.call 'Frank'		# Hi Frank
    prc.call				# Hola
  
    #-Los procedimientos se pueden usar como parametros en metodos.
    #-También se pueden usar como valor de retorno.
    def method1 proc1
      puts 'Start of method'
      proc1.call
      puts 'end the method'
    end
    hola = lambda do
      puts 'Hola'
    end					    # Start of method
                    # Hola
    method1(hola)		# end the method
