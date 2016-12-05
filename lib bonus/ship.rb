class Ship 
    attr_reader :board
    attr_accessor :ships
    
    SHIPS = { :aircraft_carrier => 5,
              :battleship => 4,
              :submarine => 3,
              :destroyer => 3,
              :patrol_boat => 2
    }
    
    def initialize
        @board = Board.new 
    end 
    
    def ship_type 
        SHIPS.keys
    end 
    
    def populate_ship(ship_type, start_position, ship_position)
        hit_pos = []
        row, col = start_position
        hit_pos << start_position
        board[start_position] = :s
        
        (SHIPS[ship_type] - 1).times do 
            if ship_position == "vertical"
                row += 1
                hit_pos << [row, col]
                board[[row, col]] = :s 
            elsif ship_position == "horizontal"
                col += 1
                hit_pos << [row, col]
                board[[row, col]] = :s 
            else 
                "Error in positioning ships"
            end 
        end
        
        hit_pos 
    end 
    
end 