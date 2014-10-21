def count_keys_equal(arr,range) #range has to be arr.max + 1
  equal = [] #equal[j] will contain the number of elements of A that equal j
  range.times do equal << 0
  end
  last_idx = arr.count - 1
  for i in 0..last_idx
    key = arr[i]
    equal[key] = equal[key] + 1
  end
  return equal
end

def count_keys_less(equal, range)
  less = []
  less[0] = 0
  for j in 1..(range-1)
    less[j] = less[j-1] + equal[j-1]
  end
  return less
end

def rearrange(arr,less,range)
  last_idx = arr.count - 1
  sorted = []
  position = [] 
  for j in 0..(range-1)
    position[j] = less[j+1] #this is self-evidence, next_index = less + 1
  end
  for i in 0..last_idx
    key = arr[i] 
    idx = position[key]
    sorted[idx] = arr[i]
    position[key] += 1 
  end
  return sorted
end

def counting_sort(arr, range)
  equal = count_keys_equal(arr, range)
  less = count_keys_less(equal, range)
  sorted = rearrange(arr, less, range)
  return sorted
end

a = [1,1,1,2,2,3,3,3,4,4,4,4,5]
print counting_sort(a, 6)


  