def sort(arr)
  l = arr.length - 1
  for i in 0..l
    smallest = i
    j = i + 1
    while j <= l
      if arr[j] < arr[smallest]
        smallest = j
      end
      j += 1
    end
    arr[i], arr[smallest] = arr[smallest], arr[i]
  end
  return arr
end