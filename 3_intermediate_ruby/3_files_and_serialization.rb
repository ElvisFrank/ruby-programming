# Serialization
# https://skorks.com/2010/04/serializing-and-deserializing-objects-with-ruby/

# Serializando objetos:
	#-Se puede guardar un objeto en un archivo
	# personaje.rb
	class Personaje
		def initialize(vida, tipo, armas)
			@vida = vida; @tipo = tipo; @armas = armas
		end
		attr_reader :vida, :tipo, :armas
	end

	$LOAD_PATH << "."
	require "personaje"

	p1 = Personaje.new(120, 'Mago', ['hechizos', 'invisibilidad'])
	File.open('juego', 'w+') { |f| Marshal.dump(p1, f) }	# Guardar
	
	File.open('juego') { |f| @p1 = Marshal.load(f) }		# Cargar
	puts "Vida: #{@p1.vida.to_s}, Tipo: #{@p1.tipo}, Poderes: #{@p1.armas.join(' - ')}"

# YAML
    require 'yaml'
    
    p YAML.load File.read('test.yaml')  # load data: YAML.load File.read('test.yaml')
    
    # Other example: 
    class Person
      attr_accessor :name, :age, :gender
      def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
      end

      def to_yaml
        YAML.dump ({
          :name => @name,
          :age => @age,
          :gender => @gender
        })
      end

      def self.from_yaml(string)
        data = YAML.load string
        p data
        self.new(data[:name], data[:age], data[:gender])
      end
    end

    p = Person.new "David", 28, "male"
    p p.to_yaml

    p = Person.from_yaml(p.to_yaml)
    puts "Name #{p.name}"
    puts "Age #{p.age}"
    puts "Gender #{p.gender}"

 # JSON
    require 'json'
    p JSON.load File.read("test.json")  # load Json data: JSON.load File.read("test.json")

    class PersonJSON
      #...
      def to_json
        JSON.dump ({
          :name => @name,
          :age => @age,
          :gender => @gender
        })
      end

      def self.from_json(string)
        data = JSON.load string
        self.new(data['name'], data['age'], data['gender'])
      end
      #...
    end

 # MessagePack
    # is binary format, take un signicantly less space than their YAML and JSON.
    # gem install msgpack
    require 'msgpack'
    msg = {:height => 47, :width => 32, :depth => 16}.to_msgpack

    #prints out mumbo-jumbo
    p msg

    obj = MessagePack.unpack(msg)
    p obj

    class PersonMSGPack
        #...
      def to_msgpack
        MessagePack.dump ({
          :name => @name,
          :age => @age,
          :gender => @gender
        })
      end

      def self.from_msgpack(string)
        data = MessagePack.load string
        self.new(data['name'], data['age'], data['gender'])
      end
      #...
    end

 # Modularizing with Mixins
    # Ruby is a dynamic language with some pretty awesome metaprogramming features. Let’s use them to make sure that we don’t pigeonhole ourselves into an approach we might later regret. First of all, notice that the Person serialization/unserialization methods created earlier seem awfully similar.
    # Let’s turn that into a mixin:

    require 'json'
    # mixin
    module BasicSerializable

      # should point to a class; change to a different
      # class (e.g. MessagePack, JSON, YAML) to get a different
      # serialization
        @@serializer = JSON

        def serialize
            obj = {}
            instance_variables.map do |var|
                obj[var] = instance_variable_get(var)
            end
            
            @@serializer.dump obj
        end
      
        def unserialize(string)
            obj = @@serializer.parse(string)
            obj.keys.each do |key|
                instance_variable_set(key, obj[key])
            end
        end
    end

    # First of all, notice that the @@serializer is set to the serializing class. This means that we can immediately change our serialization method, as long as our serializable classes include this module.
    # Taking a closer look at the code, it’s basically taking a look at the instance variables to serialize and unserialize an object/string. In the serialize method:
    def serialize
        obj = {}
        instance_variables.map do |var|
            obj[var] = instance_variable_get(var)
        end
      
        @@serializer.dump obj
    end

    # It loops over the instance_variables and constructs a Ruby hash of the variable names and their values. Then, simply use the @@serializer to dump out the object. If the serializing mechanism does not have a dump method, we can simply subclass it to give it that method!
    # We use a similar approach with the unserialize method:
    def unserialize(string)
        obj = @@serializer.parse(string)
        obj.keys.each do |key|
            instance_variable_set(key, obj[key])
        end
    end

    # Here, use the serializer to get a Ruby hash out of the string and set the object’s instance variables to the values of the hash.
    # This makes our Person class really easy to implement:
    class Person
        include BasicSerializable
        attr_accessor :name, :age, :gender
      
        def initialize(name, age, gender)
            @name = name
            @age = age
            @gender = gender
        end
    end

    # Notice, we’re just adding the include BasicSerializable line! Let’s test it out:
    p = Person.new "David", 28, "male"
    p p.serialize
    
    p.unserialize (p.serialize)
    puts "Name #{p.name}"
    puts "Age #{p.age}"
    puts "Gender #{p.gender}"
    # Now, if you comb through the code carefully (or just understand the underlying concepts), you might notice that the BasicSerializable methods work very well for objects that only have serializable instance variables (i.e. integers, strings, floats, etc. or arrays and hashes of them). However, it will fail for an object that has other BasicSerializable objects as instances.

    # The easy wasy to fix this problem is to override the serialize and unserialize methods in such classes, like so:
    class People
        include BasicSerializable
        
        attr_accessor :persons
      
        def initialize
            @persons = []
        end
      
        def serialize
            obj = @persons.map do |person|
                person.serialize
            end
        
            @@serializer.dump obj
        end
      
        def unserialize(string)
            obj = @@serializer.parse string
            @persons = []
            obj.each do |person_string|
                person = Person.new "", 0, ""
                person.unserialize(person_string)
                @persons << person
            end
        end
      
        def <<(person)
            @persons << person
        end
    end

# Creating a file and writing to it
    # The File class supplies the basic methods to manipulate files. The following script opens a new textfile in "write" mode and then writes "Hello file!" to it:
    fname = "sample.txt"
    somefile = File.open(fname, "w")
    # "w" - To new document or erase all data in a existing file
    # "a" - To existing document and doesn't erase data
    somefile.puts "Hello file!\n\nThe next line invokes the File class method open, which requires us to pass it two arguments: 1) the filename, represented by a String, and 2) the read/write mode. As you might guess, \"w\" stands for write.
Warning: Using \"w\" mode on an existing file."
    somefile.close

    # Other way - automatically closed at the end of the block.
    File.open("sample1.txt", "w"){ |somefile| somefile.puts "Hello file!\nLine 2 - aloha..."}

    # open-uri
    require "open-uri"
    remote_base_url = "http://en.wikipedia.org/wiki"
    remote_page_name = "Ada_Lovelace"
    remote_full_url = remote_base_url + "/" + remote_page_name

    #remote_data = open(remote_full_url).read
    #my_local_file = open("my-downloaded-page.html", "w") 
    #
    #my_local_file.write(remote_data)
    #my_local_file.close

    # Exercise: Copy wikipedia's front page to a file using block notation
    require 'rubygems'
    require 'rest-client'
    wiki_url = "http://en.wikipedia.org/"
    wiki_local_filename = "wiki-page.html"

    #File.open(wiki_local_filename, "w") do |file|
    #   file.write(RestClient.get(wiki_url))
    #end

# Reading from a file
    file = File.open("sample1.txt", "r")
    contents = file.read
    puts contents   #=> Lorem ipsum etc.
    # Every read operation begins where the last read operation ended. In the case where we've read the entire file (by not passing in a number), the second read call has nothing left to read.
    contents = file.read    # La segunda lectura no hará nada por que la primera ya lo hizo.
    puts contents   #=> ""

    # Using realline and readlines
    File.open("sample1.txt").readlines.each do |line|
        puts line
    end

    file = File.open("sample1.txt", 'r')
    while !file.eof?            # Returns true if there is no more data in the file to read.
       line = file.readline     # It's a ways more efficient in most scenarios when extracting something frm each line.
       puts line
    end

    # exercise
    require 'open-uri'
    url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
    puts open(url).readline
    #=> THE TRAGEDY OF HAMLET, PRINCE OF DENMARK
    
    local_fname = "hamlet.txt"
    File.open(local_fname, "w"){|file| file.write(open(url).read)}

    File.open(local_fname, "r") do |file|
       file.readlines.each_with_index do |line, idx|
          #puts line if idx % 42 == 41
       end   
    end

    lines = ["Hello world", "  How are you?", "*Fine*, thank you!.", "  OK then."]   
    lines.each do |line|
       puts line if line.match(/^  [A-Z]/)  # Start ^
    end

# Closing files
    # You can close a File by calling its close method:
    datafile = File.open("sample.txt", "r")
    lines = datafile.readlines         
    datafile.close
    lines.each{ |line| puts line }         

    # Or, you can pass a block into File.open. At the end of the block, the file is automatically     closed:
    lines = File.open("sample.txt", "r"){ |datafile| 
       datafile.readlines
    }
    lines.each{|line| puts line}

# File.exists?
    # This is a useful class method that checks whether a file or directory exists and returns true/false:    
    filename = file
    if File.exists?(filename)
       puts "#{filename} exists"
    end
    # I use it often to check whether a directory exists. If false, then I use the Dir.mkdir class method to create it:
    dirname = "data-files"
    Dir.mkdir(dirname) unless File.exists?dirname
    File.open("#{dirname}/new-file.txt", 'w'){|f| f.write('Hello world!')}

# The Dir class
    # The methods of the Dir class are useful in conjunction with file operations.

    # One of the most useful is Dir.glob, which takes in a directory name and/or a pattern with   wildcards and returns an array of filenames:


    # count the files in my Downloads directory:
    puts Dir.glob('Downloads/*').length   #=> 382

    # count all files in my Downloads directory and in sub-directories
    puts Dir.glob('Downloads/**/*').length   #=> 308858

    # list just PDF files, either with .pdf or .PDF extensions:
    puts Dir.glob('Downloads/*.{pdf,PDF}').join(",\n")

    #=> Downloads/About Downloads.pdf,
    #=> Downloads/blueprintcss-1-0-cheatsheet-4-2-gjms.pdf,
    #=> Downloads/crafting-rails-applications_b3_0.pdf,
    #=> Downloads/DOM166.pdf,
    #=> Downloads/html5-cheat-sheet.pdf,
    #=> Downloads/la_museum_free_days.pdf,
    #=> Downloads/mbapm_rec-a.pdf,
    #=> Downloads/mbapm_rec.pdf,
    #=> Downloads/metaprogramming-ruby_p2_0.pdf,
    #=> Downloads/mining-of-massive-datasets-book.pdf,
    #=> Downloads/poignant-guide.pdf,
    #=> Downloads/PrinterSchedule.pdf

    # Find the top 10 largest files
    DIRNAME = "**"
    Dir.glob("#{DIRNAME}/**/*.*").sort_by{|fname| File.size(fname)}.reverse[0..9].each do |fname|
       puts "#{fname}\t#{File.size(fname)}"
    end

    # Exercise: Determine file makeup of directories, print to spreadsheet
    hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
       ext = File.basename(fname).split('.')[-1].to_s.downcase
       hsh[ext] ||= [0,0]
       hsh[ext][0] += 1
       hsh[ext][1] += File.size(fname)   
       hsh
    end               
    File.open("file-analysis.txt", "w") do |f|
       hash.each do |arr|
         txt = arr.flatten.join("\t")
          f.puts txt
          puts txt
       end
    end

    # Exercise: Read a text file and create a Google Chart
    require 'open-uri'
    BASE_URL = "https://chart.googleapis.com/chart?cht=p&chd=t:10,20,30,40&chs=500x300&chl=Jan|Feb|Mar|Apr"
    rows = File.open("file-analysis.txt"){|f| f.readlines.map{|p| p.strip.split("\t")} }

    headers = rows[0]
    [1,2].each do |idx|
       labels = []
       values = []
       rows[1..-1].each do |row|
          labels << row[0]
          values << row[idx]
       end

       remote_google_img = URI.encode"#{BASE_URL}&chl=#{labels.join('|')}&chd=t:#{values.join(',')}"
    puts remote_google_img
      File.open('file-pie-chart.png', 'w'){|f| 
        f.write(open(remote_google_img))
      }
    end


# Files - old data
	require "open-uri"

	remote_base_url = "http://en.wikipedia.org/wiki"
	remote_page_name = "Steve_Wozniak"
	remote_full_url = remote_base_url + "/" + remote_page_name
	
	somedata = open(remote_full_url).read
	# This retrieves a webpage from the Internet address in remote_full_url
	my_local_filename = "my_copy_of-" + remote_page_name + ".html"
	
	my_local_file = open(my_local_filename, "w")
	# This opens a file – for writing into.
	my_local_file.write(somedata)
	my_local_file.close

	file_for_reading = open(my_local_filename, "r")
	# Same as above, but the file is now opened for reading, not writing.
	puts file_for_reading.read
	file_for_reading.close
 # Read and write, twice-over
	require "open-uri"

	remote_base_url = "http://en.wikipedia.org/wiki"
	r1 = "Steve_Wozniak"
	r2 = "Steve_Jobs"
	f1 = "my_copy_of-" + r1 + ".html"
	f2 = "my_copy_of-" + r2 + ".html"
	
	# read the first url
	remote_full_url = remote_base_url + "/" + r1
	rpage = open(remote_full_url).read
	
	# write the first file to disk
	file = open(f1, "w")
	file.write(rpage)
	file.close
	
	# read the second url
	remote_full_url = remote_base_url + "/" + r2
	rpage = open(remote_full_url).read
	
	# write the second file to disk
	file = open(f2, "w")
	file.write(rpage)
	file.close
	
	# open a new file:
	compiled_file = open("apple-guys.html", "w")
	
	# reopen the first and second files again
	k1 = open(f1, "r")
	k2 = open(f2, "r")
	
	compiled_file.write(k1.read)
	compiled_file.write(k2.read)

	k1.close
	k2.close
	compiled_file.close

 # All together - loops and read/write
	require "open-uri"
	remote_base_url = "http://en.wikipedia.org/wiki"

	start_year = 1900
	end_year = 1906
	# Bucle - Descargar los datos por años
	(start_year..end_year).each do |yr|
	    rpage = open(remote_base_url + "/" + yr.to_s)	# cargar pagina
	
	    local_fname = "copy-of-" + yr.to_s + ".html"
	    local_file = open(local_fname, "w")		# abrir archivo local para pagina
	    local_file.write(rpage.read)			# escribir la pagina cargada
	    local_file.close						# cerrar archivo local para pagina
	   # Optional output line:
	   puts "Wrote file " + local_fname
	   sleep 1
	end

	# Leer ficheros anteriores y guardar en uno nuevo juntos:
	compiled_file = open(start_year.to_s + "-" + end_year.to_s + ".html",  "w")
	(start_year..end_year).each do |yr|
	    local_fname = "copy-of-" + yr.to_s + ".html"
	    local_file = open(local_fname, "r")		# abrir archivo de un solo año
	
	    compiled_file.write(local_file.read)	# escribir en 1900..1906
	    local_file.close						# cerrar archivo de un solo año
	end
	compiled_file.close		# cerrar archivo de años acumulados
