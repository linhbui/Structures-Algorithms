a = [1,2,3,4,4,6,7,8,9]

def binary_search(arr,x)
    return nil if x > arr[-1] || x < arr[0]
    start_point = 0
    end_point = arr.count - 1
    while (start_point < end_point) 
        mid = ((start_point + end_point)/2).round
        if x == arr[mid]
            return mid
        elsif x > arr[mid]
            start_point = mid + 1
        elsif x < arr[mid]
            end_point = mid - 1
        end
    end
    return nil
end

puts binary_search(a,5)