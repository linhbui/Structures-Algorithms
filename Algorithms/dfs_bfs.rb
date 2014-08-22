# For a hypothetical graph/tree

require "/Structures/Priority Queue"

def dfs data
  visited = Set.new
  dfs_recursion data, [], root, visited 
end

def dfs_recursion data, path, node, visited
  visited<<node # mark the visited nodes
  if node.data == data # return the path when data is found
    return path
  end
  # otherwise, move to children
  directions = node.directions
  children = directions.map {|direction| node.next[direction]}
  
  final_path = [] # Assuming all the directions fail, so final path is empty
  
  for dir, child in directions, children
    if !visited.include?(child) # Checking the unvisited children nodes
      p = dfs_recursive(data, path + [dir], child, visited)
      if p != []
        # if found a working path, break and return
        final_path = p
        break
      end
    end  
  end
  
  return return_path
end

def bfs data
  visited = Set.new
  nextRoutes = PQueue.new
  depth = 0
  path = []
  nextRoutes.push([root, path, depth], depth) # The 2nd 'depth' indicates the priority
  
  while !nextRoutes.empty?
    current, path, depth = nextRoutes.pop
    if current.data == data
      return path
    end
    visited<<current
    depth += 1
    
    directions = node.directions
    children = directions.map {|direction| node.next[direction]}
    
    for dir, child in directions, children
      if !visited.include?(child) 
      nextRoutes.push([child, path + [dir], depth], depth)
    end
  end
end
  
    
  