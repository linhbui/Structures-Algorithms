def sort(arr)
  l = arr.length - 1
  for i in 1..l
    key = arr[i]
    j = i -1
    while j >= 0 && arr[j] > key
      arr[j+1] = arr[j]
      j -= 1
    end
    arr[j+1] = key
  end
  return arr
end