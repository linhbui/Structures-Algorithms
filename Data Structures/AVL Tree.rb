=begin AVL Tree: Keeping the balance between left children and right children: on everynode, 
it keeps the number of the nodes on the left and the number of the nodes on the right
have maximum difference of one. AVL keeps the tree tightly balanced.  
vs. Red-black tree only roughly keeps the balance so that the longest height is no more than 
twice the shortest height.

Check out this link!: https://www.cs.auckland.ac.nz/software/AlgAnim/AVL.html 
=end
class Node
  
  attr_accessor :data, :left, :right, :count_left, :count_right 
                                      # count_left: the number of children on the left of the node  
  def initialize data
    @data = data 
    @left = @right = nil
    @count_left = @count_right = 0
  end
  
  def set_left node  # BST class can't access @left & @right directly
    @left = node
  end
    
  def set_right node
    @right = node
  end
  
  def set_count_left num 
    @count_left = num
  end
  
  def set_count_right num
    @count_right = num
  end
  
end

class AVL
  
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
      @count_left += 1      # Additional step compared to BST tree, increase the count
      if node.left.nil?     
        node.set_left Node.new data
        return ?? ### No problem
      else
        operation = add_recursive data, node.left 
        # ???
        if (node.count_left - node.count_right) > 1
          return ?? ### Help! Rotate right! Parent function!
        end
      end
    else
      @count_right += 1     #Additional step compared to BST tree  
      if node.right.nil? 
        node.set_right Node.new data
      else 
        add_recursive data, node.right
      end
    end  
  end
    
  def rotate_left node
    
    
  end
  
  def rotate_right
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
  