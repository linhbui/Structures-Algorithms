class Node
  
  attr_accessor :data, :left, :right
  
  def initialize data
    @data = data 
    @left = nil
    @right = nil
  end
  
  def set_left node  # BST class can't access @left & @right directly
    @left = node
  end
    
  def set_right node
    @right = node
  end
  
end

class BST
  
  attr_accessor :root
  
  def initialize
    @root = nil
  end
  
  def add_recursive data, node #<= to the left, > to the right
    if node.data >= data
      if node.left.nil?
        node.set_left Node.new(data)
      else
        add_recursive data, node.left
      end
    else
      if node.right.nil? 
        node.set_right Node.new(data)
      else 
        add_recursive data, node.right
      end
    end
  
  end
      
  def add data
    if @root.nil? 
      @root = Node.new(data)
    else
      add_recursive data, root
    end
  
  end
  
  def search_recursive data, node
    if node.data == data
      return true
    elsif node.data < data
      if node.right.nil?
        return false
      else 
        search_recursive data, node.right
      end
    elsif node.data > data
      if node.left.nil?
        return false
      else
        search_recursive data, node.left
      end
    end
  end 
    
  def search data
    if root.nil?
      return false
    else
      search_recursive data, root
    end
  end  
  
end

# Testing 

bst = BST.new

[1, 3, 6, 8, 11, 15, 16, 18, 21, 23, 24, 26].shuffle!.each {|i| bst.add(i)}


puts bst.search(3)
puts bst.search(15)
puts bst.search(21)
puts bst.search(22)
  