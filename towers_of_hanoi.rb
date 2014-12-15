def towers_of_hanoi(num_discs)
  towers = {1 => [], 2 => [], 3 => []}
  
  num_discs.downto(1).each do |i|
    towers[1] << i
  end
  
  initial_state = towers[1]
  
  until towers[2] == initial_state || towers[3] == initial_state
    puts "Tower 1: #{towers[1]}, Tower 2: #{towers[2]}, Tower 3: #{towers[3]}"
    
    tower_from = 0
    tower_to = 0
    
    loop do
      puts "Move from which tower?"
      tower_from = gets.chomp.to_i
      
      if (1..3).include?(tower_from) && !towers[tower_from].empty?
        break
      elsif !(1..3).include?(tower_from)
        puts "Invalid Tower"
      else
        puts "Tower is empty"
      end
    end
    
    loop do
      puts "To which tower?"
      tower_to = gets.chomp.to_i
      
      if (1..3).include?(tower_to) && (towers[tower_to].empty? || towers[tower_to].last > towers[tower_from].last)
        break
      elsif tower_to == tower_from
        puts "Cannot return disc to the same tower"
      elsif !(1..3).include?(tower_to)
        puts "Invalid Tower"
      else
        puts "Cannot move disc onto smaller disc"
      end
    end
    
    towers[tower_to].push(towers[tower_from].pop)
  end
  
  puts "The Towers of Hanoi are yours!!!"
end