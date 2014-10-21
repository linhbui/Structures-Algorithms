=begin 
Priority queue: check out http://en.wikipedia.org/wiki/Priority_queue

3 properties of Heap (only applied to numbers or ordered data):
- Elements that you need to find the most should be on the top (eg, priority queue
needs to pop smaller elements first, so small elements should be on top, ie top light) 
- Always fill from left, so there won't be gap in the middle of a level
- Top levels have to be filled before starting lower level 

Interesting array representation of Heap. Check out this link:
http://www.cse.hut.fi/en/research/SVG/TRAKLA2/tutorials/heap_tutorial/taulukkona.html
=end
 
class PQueue
  
  attr_accessor :heap
  
  def initialize 
    @heap = [0] # first element is always the count of number of items in the heap
  end
  
  def push num # Note: this is a top-light heap
    @heap<<num
    @heap[0] += 1
    swim[@heap[0]]
  end
  
  def swim idx # pull the small item up the top
    while idx > 1 && @heap[idx] <= @heap[idx/2]      
      @heap[idx/2], @heap[idx] = @heap[idx/2], @heap[idx]
      idx = idx/2
    end
  end
  
  def sink idx # push the big item down
     j = idx * 2 + 1
     last_idx = @heap[0]
    while j <= last_idx # Check if both children exists
      if @heap[j] > @heap[j-1]
        j -= 1
        if @heap[idx] > @head[j]
          @heap[idx], @head[j] = @head[j], @head[idx]
          idx = j
          j = idx * 2 + 1
        else
          break
        end
      end
    end
    
    j -= 1
    if j <= last_idx # If only one child exist
      if @heap[idx] > @heap[j]
        @heap[idx], @head[j] = @head[j], @head[idx]
      end
    end
  end
       
      idx < @heap[0] && @heap[idx] > @heap[idx*2]
      @heap[idx], @heap[idx*2] = @heap[idx*2], @heap[idx]
      idx *= 2
    end
  end
  
  def pop
    count = @heap[0]
    if count == 0 # Check if heap is empty
      puts "Empty"
    else
      puts @heap[1]
      @heap[1] = @heap[count]
      @heap.pop
      @heap[0] -= 1
      sink 1
    end
  end
  
  def count
    puts @heap[0]
  end
       

  