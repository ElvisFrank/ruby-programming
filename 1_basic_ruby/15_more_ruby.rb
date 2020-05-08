# Azúcar sintáctico:
	# codificar la menor cantidad de codigo
	attr_reader, attr_writer , attr_accessor
    # Los metodos pueden terminar en =	
    def nombre= (nuevo_nombre) 
        #.. 
    end

# Duck Typing
	# dejar un poco de lado la clase y centrar en su comportamiento.
	#   ||	============================================	||
	#   || Si camina como un pato, nada como un pato y		||
	#   || hace "quack", podemos tratarlo como un pato.		||
	#   || 							-James Whitcomb Riley.	||
	#   ||	============================================	||
	# Comprobamos qué objetos responden al método t_str 
	puts ('Una cadena'.respond_to? :to_str)		# => true  
	puts (Exception.new.respond_to? :to_str)	# => true  
	puts (4.respond_to? :to_str)				# => false
	
	class Pato  
	    def quack; 'Quack!'; end
	    def nadar; 'Paddle paddle paddle...'; end
	end	
	class Ganso  
	    def honk; 'Honk!'; end  # onomatopia de un pato
	    def nadar; 'Splash splash splash...'; end
	end	
	class GrabadoraDePatos
	    def quack; play; end
	    def play; 'Quack!'; end
	end

	def haz_quack(pato)	# En este método, la Grabadora
	    pato.quack		# se comporta como un Pato
	end
	puts haz_quack(Pato.new)				# Quack!
	puts haz_quack(GrabadoraDePatos.new)	# Quack!

	def haz_nadar(pato)	# Para este método, el Ganso
	    pato.nadar		# se comporta como un Pato
	end
	puts haz_nadar(Pato.new)	# Paddle paddle paddle...
	puts haz_nadar(Ganso.new)	# Splash splash splash...
    
# RAILS:
	# el código de Rails hace un fuerte uso de los módulos, en particular,
	# la técnica de reabrir las definiciones de clases y módulos.

# Self:
	#-En cada instante de ejecución, hay uno y sólo un self
	puts self					# main
	class S
		puts 'Comenzó la clase S'  
		puts self				# S
		module M  
	    	puts 'Módulo anidado S::M'  
	    	puts self			# S::M
	    end
	    puts 'De regreso en el nivel más superficial de S'  
	    puts self				# S
	    def method
	        puts 'Dentro de un metodo'
	        puts self			# <S:0x2835908>
        end
    end
    
    s = S.new  
    s.method

# Alias:
    alias escribir puts
    alias_method :new_method_name, :method_name

# Missing_methods:
    def method_missing(m, *args)
        puts 'La wea no se encuentra'
    end

# Default values:
    def hello(name = 'there')
        puts "Hi #{name}"
    end

# Variable number of arguments:
    def my_method (*my_args)
        my_args.each do |item|
            puts item
        end
    end

# Optionals arguments:
    def my_method (var1, var2, *my_args)
        puts "Suma: #{var1 + var2}, And more: #{my_args}"
    end

# librerias:
    $LOAD_PATH << "."
    require 'archivo'	#Lee una unica vez el fichero (se asume que es .rb)
    load 'archivo.rb'	#Lee el fichero indicado en cada instrucción

# Excepciones:
    # excepción (clase Exception)
	# raise tratará el problema 
    def raise_and_rescue  
        begin  			# Similar a try{..}
            puts 'Estoy antes del raise'
            raise 'Un error ha ocurrido'		# simulamos un error
            puts 'Estoy después del raise'		# Se omite hasta rescue
        rescue  			# Similar a catch{..}
            puts 'Estoy rescatado del error.'  
        end  
        puts 'Estoy después del bloque'
    end					# Estoy antes del raise
						# Estoy rescatado del error.
	raise_and_rescue	# Estoy después del bloque

    begin 
        #ejecución que podría dar error
    rescue UnTipoDeExcepcion
        # ..
    rescue OtroTipoDeExcepcion
        # ..
    else 
        # Otras excepciones
	end

 # para saber que Exception se a producido:
	begin
	  raise 'Test de excepcion'
	rescue Exception => e
	  puts e.message            # Test de excepción
	  puts e.backtrace.inspect   # ["nombre de fichero:linea de la excepción"]
	end

    splat:
	- [] de argumentos, admite cero o N argumentos que se almacenaran en un array []
	-Tambien se pude convertir en un array en una lista de elemetos.
	def my_hello(mensaje, *my_arg_splat)
		my_arg_splat.each {|persona| puts "#{mensaje} #{persona}"}
	end
	nombres = ['Uriel', 'Mei']		# un Array como argumento
	my_hello 'Hey Hola', *nombres	# Al ser un solo elemento se debe convertir en un lista de elementos

# Sobrecarga de métodos:
	-Se puede crear varios metodos con el mismo nombre, si el numero de arg es diferente
	casa.vecinos
	casa.vecinos('Juan')
	casa.vecinos('Marlen', 'Jeremias')

# Polimorfismo:
	#-Solo se requiere que el metodo este creado
	class Vimeo
		def play
			p 'Inserta el reproductor vimeo'
		end
	end
	class YouTube
		def play
			p 'Inserta el reproductor youtube'
		end
	end
	
	videos = [YouTube.new, Vimeo.new, YouTube.new, Vimeo.new, Vimeo.new]
	videos.each do |video|
		video.play
	end
	
# Congelación de objetos:
	#-Objetos Inmutables, son los que no pueden cambiar de estado despues de ser creados.
	str = 'Un simple string'
	str.freeze		#congela el objeto, pero se puede modificar con:
					# str[x] o str += // debido a que se cambio de objeto

# Control de Acceso y Accesores
    # public, protected y private
	class ControlAcceso
		def method_1;   end			# public
		protected
			def method_2;   end		# Protegido
		private
			def method_3;   end		# Privado
			def method_4;   end		# Privado
		
		# También puede ser:
		def method_1;   end			# public
		def method_2;   end			# Protegido
		def method_3;   end			# Privado
		def method_4;   end			# Privado
		public :method_1
		protected :method_2
		private :method_3, :method_4
	end

# Matrix
    require 'matrix'
    matriz = Matrix[[1,2,3],[4,5,6],[7,8,9]]
    matriz.each(:diagonal) do |i| puts i end
    :strict_upper   #elementos arriba de la diagonal
    :strict_lower   #elementos abajo de la diagonal


# Parsing the Tweets
    # gem install crack
    # helpful library that makes it easy to programmatically read XML
    require "rubygems"
    require "crack"
  
    xml = '
    <?xml version="1.0" encoding="UTF-8"?>
    <person>Tim Berners-Lee</person>      
    '
    parsed_xml = Crack::XML.parse(xml)
    puts parsed_xml['person']

 # With Hashes
    require "rubygems"
    require "crack"
    require "pp"
  
    xml = '
    <?xml version="1.0" encoding="UTF-8"?>
    <people>
        <person>
          <first_name>Tim</first_name>
          <last_name>Berners-Lee</last_name>  
        </person>  
        <person>
          <first_name>Robert</first_name>
          <last_name>Cailliau</last_name>  
        </person>  
    </people>
    '
  
    parsed_xml = Crack::XML.parse(xml)
    puts parsed_xml['people']['person'][0]['first_name']
    puts parsed_xml['people']['person'][1]['first_name']
  