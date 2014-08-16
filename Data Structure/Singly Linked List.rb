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

class SinglyLinkedList

    attr_accessor :head

    # Note to self: @head.nil?: Testing whether the node is there --> list itself empty?
    # meanwhile, @head.value.nil: the node is there, so test whether if its value is nil
    def initialize
      @head = nil
    end

    def add_end value
      if @head.nil?
        @head = Node.new value
      else
        current_node = @head
        while current_node.next       # go to the next node until the next node is empty, i.e. the end of the list
          current_node = current_node.next 
        end
        current_node.next = Node.new value
      end
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

    def find value 
      current_node = @head
      while !current_node.nil?
        return current_node if current_node.value == value #accessing "val" variable under "someClass" : someClass.val
        current_node = current_node.next
      end
      nil
    end
    
    def pop_front
      return nil if @head.nil?
      val = @head.value
      @head = @head.next
      return val
    end
    
    def pop_end
      return nil if @head.nil?
      
      if @head.next = nil
        val = @head.value
        @head = nil
        return val
      end
      
      current_node = @head
      while !current_node.next.next.nil?
        current_node = current_node.next
      end
      val = current_node.next.value
      current_node.next = nil
      return val
      
    end

    def remove value
      return nil if @head.nil?
      if @head.value == value
        @head = @head.next
      else
        current_node = @head.next
        prev_node = @head
        while current_node
          if current_node.value == value
            prev_node.next = current_node.next
            return true
          end
          prev_node, current_node = current_node, current_node.next 
        end
        nil
      end
    end
end