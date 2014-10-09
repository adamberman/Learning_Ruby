def stock_picker(array)
  buy = 0
  sell = 0
  greatest_profit = 0
  (0...array.count).each do |buy_date|
    (buy_date...array.count).each do |sell_date|
      if array[sell_date] - array[buy_date] > greatest_profit
        buy = buy_date
        sell = sell_date
        greatest_profit = array[sell_date] - array[buy_date]
      end
    end
  end
  [buy, sell]
end