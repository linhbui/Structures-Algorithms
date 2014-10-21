# Queue: FIFO. Think of the rocket pencil! 
# Sample use: when order is critical

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

class Queue

    attr_accessor :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    def add_end value                # Check back with add_end in Singly Linked List to see the magic!
      if @head.nil?
        @head = Node.new value
        @tail = @head
      else
        @tail.next = Node.new value
        @tail = @tail.next
      end
    end
    
    def pop_front                     # pop_front is more efficient than pop_end
      return nil if @head.nil?
      val = @head.value
      if @head == @tail
        @head = @tail = nil
      else
        @head = @head.next
      end
      return val
    end

end