# Stack: LIFO. Like a pile of books! Last thing you put in is on the top
# Sample use: backtracking in a maze

class Node
    attr_accessor :value, :next

    def initialize value=nil
        @value = value # = self.value in Python
        @next = nil
    end

    def value
        @value
    end
end


class Stack

    attr_accessor :head

    def initialize
      @head = nil
    end
    
    def add_front value
      if @head.nil?
        @head = Node.new value
      else
        new_node = Node.new value
        new_node.next = @head
        @head = new_node   
      end
    end     
    
    def pop_front
      return nil if @head.nil?
      val = @head.value
      @head = @head.next
      return val
    end

end