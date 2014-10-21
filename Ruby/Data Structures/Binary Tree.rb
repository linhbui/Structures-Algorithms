class Node
  
  attr_accessor :data, :left, :right
  
  def initialize data
    @data = data
    @left = nil
    @right = nil
  end
  
  def set_left node
    @left = node
  end
    
  def set_right node
    @right = node
  end
  
end

class Binary_tree
  
  attr_accessor :root
  
  def initialize
    @root = nil
  end
  
end

  