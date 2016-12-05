class Board
    attr_reader :grid 
    
    def self.default_grid
        Array.new(10) { Array.new(10) }
    end
    
    def initialize(grid = self.class.default_grid)
        @grid = grid
    end
    
    def [](pos)
        row, col = pos 
        grid[row][col]
    end
    
    def []=(pos, mark)
        row, col = pos 
        grid[row][col] = mark 
    end 
    
    def count
        grid.flatten.count(:s)
    end 
    
    def empty?(pos = nil)
        pos.nil? ? !grid.flatten.include?(:s) : self[pos].nil?
    end
    
    def full?
        !grid.flatten.include?(nil)
    end 
    
    def place_random_ship
        raise "the board is full" if full? 
        self[empty_grid.sample] = :s
    end 
    
    def won?
        !grid.flatten.include?(:s)
    end
        
    def display
        print_grid_number
        print_grid_symbol
    end 
      
    def populate_grid(num_ships)
        num_ships.times { place_random_ship }
    end
       
    def in_range?(pos)
        empty_grid.include?(pos) 
    end 
        
    private 
    def empty_grid
        empty = []
        grid.length.times do |row|
            grid[row].length.times do |col|
                empty << [row, col] if grid[row][col] == nil 
            end 
        end 
        empty 
    end
    
    def print_grid_number
        print "  | "
        puts (0...grid[0].length).map { |idx| idx.to_s }.join(" | ")
    end
    
    def print_grid_symbol
        grid.map do |row|
            row.map do |ele|
                if ele == :x 
                    "X"
                elsif ele == :SS
                    "S"
                else 
                    " "
                end 
            end 
        end.each_with_index { |row, idx| puts "#{idx} | #{row.join(" | ")} |" }
    end 
end
