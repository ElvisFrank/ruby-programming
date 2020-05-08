def stock_picker days
    best_prices = days.combination(2).reduce([days.first, days.last]) do |result, data|
        data[1] - data[0] > result[1] - result[0] ? data : result
    end
    buy =  days.index(best_prices[0])    
    sell = days.index{|day| day == best_prices[1]}

    #sell_2 = 1 + buy + days[(buy + 1)...].index{|day| day == best_prices[1]}
    #
    #sell_3 =  days.each_with_index.reduce(buy) do |result, data|
    #    day, index = data
    #    break index if (result < index && day == best_prices[1])
    #    result
    #end
    [buy, sell]
end

RSpec.describe "testo to stock_picker method" do
    it "with a example by theodinproject.com" do
        days = [17,3,6,9,15,8,6,1,10]
        result = [1,4]
        expect(stock_picker days).to eq result
    end
end