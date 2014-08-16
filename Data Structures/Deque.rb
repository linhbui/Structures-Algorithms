# Elements can be added or popped both from front and back
# It's actually not necessary to make double-linked-list for deque. 

class Node
    attr_accessor :value, :prev, :next

    def initialize value=nil
        @value = value
        @next = nil
        @prev = nil
    end

    def value
        @value
    end
end

class Deque

    attr_accessor :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    def add_end value                
      if @head.nil?
        @head = Node.new value
        @tail = @head
      else
        @tail.next = Node.new value
        @tail.next.prev = @tail
        @tail = @tail.next
      end
    end
    
    def add_front value
      if @head.nil?
        @head = Node.new value
        @tail = @head
      else
        @head.prev = Node.new value
        @head.prev.next = @head
        @head = @head.prev   
      end
    end     
    
    def pop_front
      return nil if @head.nil?
      val = @head.value
      @head = @head.next
      @head.prev = nil     # For garbage collection purpose. Without this step, new @head.prev still points to the old @head so Ruby cannot safely delete the old @head.
      return val
    end
    
    def pop_end
      return nil if @head.nil?
      val = @tail.value
      @tail = @tail.prev
      @tail.next = nil    # Check out not for pop_front
      return val
    end

end