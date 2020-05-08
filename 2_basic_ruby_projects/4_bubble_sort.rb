
def bubble_sort numbers
    limit = numbers.length
    iterationes = 0
    (0...limit).each do |index|
        (1...(limit-index)).each do |index_2|
            iterationes += 1

            next unless numbers[index_2 - 1] > numbers[index_2]
            temp = numbers[index_2]
            numbers[index_2] = numbers[index_2 - 1]
            numbers[index_2 - 1] = temp
        end
    end
    puts "Iteraciones: #{iterationes}"
    numbers
end

RSpec.describe "test bubble_sort" do
    it "test 1" do
        data = [4,3,78,2,0,2]
        result = [0,2,2,3,4,78]
        expect(bubble_sort data).to eq result
    end
end