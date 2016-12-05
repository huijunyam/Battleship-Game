class HumanPlayer
    attr_reader :name 
    
    def initialize(name)
        @name = name 
    end 
    
    def get_play
        puts "Give a coordinate in term of 'x,y'"
        gets.chomp.split(",").map(&:to_i)
    end
    
end
