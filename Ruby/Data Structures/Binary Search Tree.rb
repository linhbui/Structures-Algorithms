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
  
  def add data
    if @root.nil? 
      @root = Node.new data
    else
      add_recursive data, root
    end
  end
  
  def add_recursive data, node #<= to the left, > to the right
    if node.data >= data
      if node.left.nil?     
        node.set_left Node.new data 
      else
        add_recursive data, node.left
      end
    else
      if node.right.nil? 
        node.set_right Node.new data
      else 
        add_recursive data, node.right
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
  
  def in_order_traversal # print small numbers first, print root, then big number, everything has be in order.
    traversal_recursive root
  end
  
  def in_order_traversal_recursive node
    if node.nil?
      return # to parent
    end
    traversal_recursive node.left
    puts node.data
    traversal_recursive node.right 
    return # to parent
  end
  
  def pre_order_traversal # print the root first, print left, then print right. Recursive.
    in_order_traversal_recursive root
  end
  
  def pre_order_traversal_recursive node
    if node.nil?
      return 
    end
    puts node.data
    traversal_recursive node.left
    traversal_recursive node.right 
    return 
  end
  
  def post_order_traversal # print the left, print the right, then the root

  end
  
  def post_order_traversal_recursive node     
    if node.nil?
      return 
    end
    traversal_recursive node.left
    traversal_recursive node.right
    puts node.data 
    return 
  end
    
      
end


# Testing 

bst = BST.new

[1, 3, 6, 8, 11, 15, 16, 18, 21, 23, 24, 26].shuffle!.each {|i| bst.add(i)}


puts bst.search(3)
puts bst.search(15)
puts bst.search(21)
puts bst.search(22)
  