require './PolyNodeTree with dfs & bfs'
require 'debugger'

=begin
 a class that will find a path for a Chess Knight from a starting position to an
end position. Both the starting and ending position should be on a standard 8x8 
chess board.
=end

class KnightPathFinder
  
  attr_accessor :root
  
  def initialize(starting_pos)
    @starting_pos = starting_pos  
    @root = PolyTreeNode.new(starting_pos)
    @visited_positions = []
  end
  
  def new_move_positions(pos)
    possible_moves = valid_moves(pos)
    new_move_positions = []
    possible_moves.each do |move|
      new_move_positions << move unless @visited_positions.include?(move)
    end
    new_move_positions
  end


  def valid_moves(pos)
    res = []
    x, y = pos[0], pos[1]
    arr = [ -2, -1, 1, 2]
    arr.each do |xcoord|
      arr.each do |ycoord|
        res << [x + xcoord, y + ycoord] if (xcoord ** 2) + (ycoord ** 2) == 5 
      end
    end
  
    return res.select do |item|
      x = item[0]
      y = item[1]
      (x > -1 && x < 8) && (y > -1 && y < 8) 
    end

  end

  
  def build_move_tree
    queue = [@root]

    until queue.empty?
      node = queue.shift
      @visited_positions << node.value

      valid_moves = new_move_positions(node.value)
      
      valid_moves.each do |pos|
        child_node = PolyTreeNode.new(pos)
        child_node.parent = node
        queue << child_node
      end
    end
  end
  
  def find_path end_pos
    end_node = @root.dfs(end_pos)
    return end_node.trace_path_back
  end

end



 