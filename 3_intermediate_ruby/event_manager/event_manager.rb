# https://devdocs.io/ruby~2.6/csv#method-c-open
# gem install csv
# with File
    puts "EventManager initialized. With File"

    lines = File.readlines "event_attendees.csv"
    lines.each_with_index do |line,index|
        break # test
      next if index == 0
      columns = line.split(",")
      name = columns[2]
      puts name
    end

# CSV
    puts "EventManager initialized. CSV"
    require 'csv'

    def clean_zipcode zipcode
    #    if zipcode.nil?
    #        "00000"
    #    elsif zipcode.length < 5
    #        zipcode.rjust5, "0")
    #    else
    #        zipcode[0..4]
    #    end
        zipcode.to_s.rjust(5, "0")[0..4]
    end

    CSV.foreach("event_attendees.csv", headers: true, header_converters: :symbol) do |row|
        break # test
        name = row[:first_name]
        zipcode = clean_zipcode row[:zipcode]
        # puts row.inspect
        puts "#{name}\t\t#{zipcode}"
    end

 # Using Sunlight - API
    puts "EventManager initialized. Using Sunlight - API"
    require 'csv'
    require 'google/apis/civicinfo_v2'

    def legislators_by_zipcode(zip)
        civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
        civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

        begin
            legislators = civic_info.representative_info_by_address(
                address: zip,
                levels: 'country',
                roles: ['legislatorUpperBody', 'legislatorLowerBody']
            )
            legislators = legislators.officials
            legislator_names = legislators.map(&:name)
            
            legislator_names.join(", ")
        rescue
            "You can find your representatives by visiting www.commoncause.org/take/..."
        end
    end

    contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
    contents.each do |row|
        break # test
        name = row[:first_name]
        zipcode = clean_zipcode(row[:zipcode])
        legislators = legislators_by_zipcode(zipcode)
        puts "#{name} #{zipcode} #{legislators}"
    end

    # string multi-line
    form_letter = %{
        <html>
        <head>
          <title>Thank You!</title>
        </head>
        <body> </body>
        </html>
    }

# Form Letters
    puts "EventManager initialized. Form Letters"
    # Using a template
    template_letter = File.read 'form_letter.html'
    CSV.read('event_attendees.csv', headers: true, header_converters: :symbol).each do |row|
        break # test
        name = row[:first_name]
        zipcode = clean_zipcode(row[:zipcode])
        legislators = legislators_by_zipcode(zipcode)

        personal_letter = template_letter.gsub('FIRST_NAME', name)
        personal_letter.gsub!('LEGISLATORS', legislators)

        puts personal_letter
    end

# Ruby's ERB
    puts "EventManager initialized. Ruby's ERB"
    require 'erb'
    meaning_of_life = 42

    question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life %>"
    template = ERB.new question

    results = template.result(binding)
    puts results

 # Using ERB
    puts "EventManager initialized. Using ERB"
    require 'csv'
    require 'google/apis/civicinfo_v2'
    require 'erb'
    #def clean_zipcode()..

    # Simplify our legislators_by_zipcode to return the original array of legislators
    def legislators_by_zipcode zip
        civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
        civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

        begin
            civic_info.representative_info_by_address(
                address: zip,
                levels: 'country',
                roles: ['legislatorUpperBody', 'legislatorLoweBody']
            ).officials
        rescue
            "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-oficials"
        end
    end

    contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
    template_letter = File.read "form_letter.erb"
    erb_template = ERB.new template_letter

    # Outputting form letters to a file
    # Outputting each form letter to the screen was useful for ensuring our output looked correct. It is time to save each form letter to a file.
    # Each file should be uniquely named. Fortunately, each of our attendees has a unique id—the first column, or row number.
        # Assign an ID for the attendee
        # Create an output folder
        # Save each form letter to a file based on the id of the attendee
    contents.each do |row|
        id = row[0]
        name = row[:first_name]
      
        zipcode = clean_zipcode(row[:zipcode])
        legislators = legislators_by_zipcode(zipcode)
        form_letter = erb_template.result(binding)
        # We make a directory named "output" if a directory named "output" does not already exist.
        Dir.mkdir("output") unless Dir.exists? "output"
        filename = "output/thanks_#{id}.html"
      
        File.open(filename,'w') { |file| file.puts form_letter}
    end

