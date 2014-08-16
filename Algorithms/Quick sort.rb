def shuffle(arr)
  l = arr.count
  while l > 1:
    i = rand(0, l - 1)
    arr[i], arr[l-1] = arr[l-1], arr[i]
    l -= 1
  end
  return arr
end

def quicksort(arr)
  copy = arr
  length = copy.count
  return copy if length < 2
  copy.shuffle! #shuffle to make everything random -> eliminate worst case
  partitioning(copy, 0, length - 1)
  return copy
end

def partitioning(arr, start, endp)
  return arr if endp <= start
  pivot = arr[start]
  i = start + 1
  j = endp
  
  while true 
    while i <= j && arr[i] < pivot #if smaller than pivot, move on
      i += 1
    end
    while i < j && arr[j] >= pivot #if bigger than pivot, continue move down
      j -= 1
    end
    if i >= j #break when i = j -> the barrier between left group and right group
      break
    end
    arr[i], arr[j] = arr[j], arr[i] #so when arr[i] > pivot or arr[j] < pivot, swap them
  end
  
  arr[start], arr[i-1] = arr[i-1], arr[start] #now swap the pivot to its place
  partitioning(arr,start, i - 2)
  partitioning(arr, i, endp)
end


  