class HumanPlayer
    attr_reader :name, :ships, :hit_list, :board   
    
    def initialize(name, ships)
        @name = name 
        @ships = ships
        @board = ships.board 
        @hit_list = Array.new(5)
    end 
    
    def get_play
        puts "#{name}, give a coordinate in term of 'x,y'"
        gets.chomp.split(",").map(&:to_i)
    end
    
    def player_setup 
        ships.ship_type.each_with_index do |ship, idx|
            board.display
            puts "#{name}, please position your #{ship.to_s}"
            start_position = gets.chomp.split(",").map(&:to_i)
            
            while (board[start_position] == :s)
                puts "The coordinate is occupied, please give another position"
                start_position = gets.chomp.split(",").map(&:to_i)
            end 
            
            puts "How to position #{ship.to_s}? vertical or horizontal"
            ship_position = gets.chomp 
            @hit_list[idx] = ships.populate_ship(ship, start_position, ship_position)
        end 
        
        puts "Finish positioning"
    end
    
    def update_list(pos) 
        hit_list.each { |ship| ship.delete(pos) if ship.is_a?(Array) }
    end 
    
    def update_details
        hit_list.each_with_index do |ship, idx|
            if ship.empty?
                puts "#{ships.ship_type[idx].to_s} has been destroyed" 
                @hit_list[idx] = "-"
            elsif ship != "-" 
                puts "#{ships.ship_type[idx].to_s} has not been destroyed"
                puts "#{ship.length} hits left"
            else
                puts "#{ships.ship_type[idx].to_s} has been destroyed" 
            end
        end 
    end 
end
