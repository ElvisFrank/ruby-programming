# loop
    i = 0
    loop do
      puts "i is #{i}"
      i += 1
      break if i == 10
    end

# While - when is true
    i = 0
    while i < 10 do
     puts "i is #{i}"
     i += 1
    end

# until - when is false
    i = 0
    until i > 10 do
     puts "i is #{i}"
     i += 1
    end

# ranges
    (1..5)      # inclusive range: 1, 2, 3, 4, 5
    (1...5)     # exclusive range: 1, 2, 3, 4

    # We can make ranges of letters, too!
    ('a'..'d')  # a, b, c, d

    # More using
    (1..3).to_a 					#1, 2, 3
	(1...5).to_a					#1, 2, 3, 4
	
	nums = -1...9
	puts nums.include?(5)   		# true
	puts nums.min					# -1
	puts nums.max           		# 8
	print nums.reject {|i| i < 5} 	# [5, 6, 7, 8]

	puts (1..10) === 5       		# true  
	puts (1..10) === 15      		# false  
	puts (1..10) === 3.14159 		# true  
	puts ('a'..'j') === 'c'  		# true

# for - ranges, arrays - iterate through a collection
    for i in 0..5
        puts "#{i} zombies incoming!."
    end
    for i in ['casa', 'choza', 'jacal']
        puts "#{i} zombies incoming!."
    end

# times - for a specified number of times
    5.times do |number|
        puts "Alternative fact number #{number}"
    end
# upto | downto
    5.upto(10) {|num| print "#{num} " }     #=> 5 6 7 8 9 10
    10.downto(5) {|num| print "#{num} " }   #=> 10 9 8 7 6 5

