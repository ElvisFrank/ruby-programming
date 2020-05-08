# ceating Hashes
    my_hash = { 
        "a random word" => "ahoy", 
        "Dorothy's math test score" => 94, 
        "an array" => [1, 2, 3],
        "an empty hash within a hash" => {} 
    }

    my_hash = Hash.new      #=> {}
    
    hash = { 9 => "nine", :six => 6 }

# Accessing Values
    shoes = {
        "summer" => "sandals",
        "winter" => "boots"
    }
    shoes["summer"]   #=> "sandals"
    shoes["hiking"]   #=> nil
    shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"
    # En caso de return "nil" es mejor pasar un segundo parametro (default) para evitar romper el programa.
    shoes.fetch("hiking", "hiking boots") #=> "hiking boots"

# Adding and Changing Data
    shoes["fall"] = "sneakers"
    shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}
    
    #You can also use this approach to change the value of an existing key.
    shoes["summer"] = "flip-flops"
    shoes     #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}

# Renoving Data
    shoes.delete("summer")    #=> "flip-flops"
    shoes                     #=> {"winter"=>"boots", "fall"=>"sneakers"}

# Methods - responds to many of the same methods as Arrays.
    books = { 
        "Infinite Jest" => "David Foster Wallace", 
        "Into the Wild" => "Jon Krakauer" 
    }

    books.keys      #=> ["Infinite Jest", "Into the Wild"]
    books.values    #=> ["David Foster Wallace", "Jon Krakauer"]

# Merging Two Hashes - merge!
    h1 = { "a" => 100, "b" => 200 }
    h2 = { "b" => 246, "c" => 300 }
    h3 = { "b" => 357, "d" => 400 }

    h1.merge          #=> {"a"=>100, "b"=>200}
    h1.merge(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
    h1.merge(h2, h3)  #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
    h1.merge(h2) {|key, oldval, newval| newval - oldval}
                      #=> {"a"=>100, "b"=>46,  "c"=>300}
    h1.merge(h2, h3) {|key, oldval, newval| newval - oldval}
                      #=> {"a"=>100, "b"=>311, "c"=>300, "d"=>400}
    h1                #=> {"a"=>100, "b"=>200}

# Symbols as Hash Keys
    # 'Rocket' syntax 
    american_cars = { 
      :chevrolet => "Corvette", 
      :ford => "Mustang", 
      :dodge => "Ram" 
    }
    # 'Symbols' syntax
    japanese_cars = { 
      honda: "Accord", 
      toyota: "Corolla", 
      nissan: "Altima" 
    }
    american_cars[:ford]    #=> "Mustang"
    japanese_cars[:honda]   #=> "Accord"
