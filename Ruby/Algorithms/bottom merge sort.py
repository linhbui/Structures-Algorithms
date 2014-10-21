def mergesort(arr1, option):
    """
    implementation of bottom-up two-array-swap merge sort
    basically, start by pairing indices 1:1 from the beginning.
    then step up to 2:2, 4:4 until (step > length)
    """
    length = len(arr1)
    if length < 2:
        return arr1
    # make a copy, since mergesort needs O(n) space
    arr2 = arr1[:]
    step = 1
    while step < length:
        i, curr = 0, 0  # beginning of each pair, current write point
        while i + step < length:
            left, right = i, i + step
            while curr < length and curr < i + 2 * step:
                if right == length or right == i + 2 * step:
                    arr2[curr] = arr1[left]
                    left += 1
                elif left == i + step:
                    arr2[curr] = arr1[right]
                    right += 1
                elif arr1[left] <= arr1[right]:
                    arr2[curr] = arr1[left]
                    left += 1
                elif arr1[left] > arr1[right]:
                    arr2[curr] = arr1[right]
                    right += 1
                curr += 1
            i += 2 * step
        # important: copy the untouched end to the new array. It's not applied yet
        while curr < length:
            arr2[curr] = arr1[curr]
            curr += 1
        step *= 2
        # swap two arrays for cost efficiency
        arr1, arr2 = arr2, arr1
    return arr1

import random
arrRand = [random.randint(0, 10) for i in range(30)]

print mergesort(arrRand)