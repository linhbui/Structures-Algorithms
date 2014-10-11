class PolyTreeNode
  def initialize value
    @value = value
    @parent = nil
    @children = []
  end
  
  def inspect
    value
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent= node
    old_parent = @parent
    
    old_parent.children.delete(self) if old_parent != nil
    
    @parent = node
    
    if node != nil && !@parent.children.include?(self)
       @parent.children << self    
    end
  end
  
  def add_child node
    @children << node
    node.parent = self
  end
  
  def remove_child node
    raise_error unless @children.include?(node) 
    @children.delete(node)
    node.parent = nil
    end
  end  
  
  def dfs(data)
    return self if @value == data

    @children.each do |child|
     res = child.dfs(data)
     return res unless res.nil?  
    end
  
    nil
  end
  
  def bfs(data)
    
    queue = []
    queue << self
    
    until queue.empty?
      node1 = queue.shift
      return node1 if node1.value == data
      node1.children.each { |child| queue << child }
    end
    
    nil
  end
  
  def trace_path_back 
    res = [self.value]
    current = self
    until current.parent.nil?
      res << current.parent.value
      current = current.parent
    end
    res
  end
  
end




