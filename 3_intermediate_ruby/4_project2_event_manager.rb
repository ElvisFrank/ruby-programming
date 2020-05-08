
#Teoria en event_manager/

puts "------------Exercise------------"
require 'csv'
require 'date'

def clear_zip_code zip
    zip.to_s.rjust(5, '0')[0..4]
end

def clear_phone_number phone
    phone = phone[1...] if phone.length == 11 && phone[0].to_s =='1'
    phone.length == 10 ? phone : 'BAD NUMBER'
end

def most_hours_register data
    hours = Hash.new(0)
    data.each do |date|
        hours[date.strftime("%H")] += 1
    end
    acc = {hora: 00, value: 0}
    hours.each {|key, value| acc[:hora], acc[:value] = key, value if value > acc[:value]}
    acc.to_a
end

def days_of_the_week_did_most_people_register(data)
    data.inject(Hash.new(0)) do |days, date|
        days[date.strftime("%A")] += 1
        days
    end.sort_by {|k, v| -v}.to_h
end

data_dates = Array.new
CSV.foreach("event_manager/event_attendees.csv", headers: true, header_converters: :symbol) do |row|
    name = row[:first_name]
    zipcode = clear_zip_code(row[:zipcode])
    home_phone = clear_phone_number(row[:homephone])
    date = row[:regdate].split(/[\/\s:]+/).map{|x| x.to_i}
    date[0] += 2000
    #date = "20#{date[0]}-#{date[2]}-#{date[1]} #{date[3]}:#{date[4]}:00"
    # puts row.inspect
    begin
        data_dates << Time.new(date[0], date[2], date[1], date[3], date[4],0,"+05:00")
    rescue
    end
    puts "#{name}\t\t#{zipcode}\t\t#{home_phone}\t\t#{date}"
end
p most_hours_register(data_dates)
p days_of_the_week_did_most_people_register(data_dates)

