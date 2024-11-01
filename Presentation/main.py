import copy

def starmaxxing(S) -> int:
    n = len(S)
    c = 0
    A = copy.deepcopy(S)
    for i in range(n):
        lvl = i+1
        for j in range(n-i):
            if A[j]/lvl > 0.5:
                c += 1
            if j != n-lvl: # don't hit last element
                A[j] += S[j+i+1]
        print(f'lvl: {lvl} | c: {c} | A: {str(A)}')
    return c

def starmaxxing2(pixels):
    n = len(pixels)
    prefix_sum = 0
    star_dense_count = 0
    prefix_sum_count = {0: 1}  # Offset to handle cases where prefix_sum is already positive

    for pixel in pixels:
        # Update prefix_sum based on whether the pixel is a star (1) or empty space (0)
        prefix_sum += 1 if pixel == 1 else -1
        
        # Count how many previous prefix sums are less than the current one
        # All subarrays ending here that would have net stars > empty spaces
        for prev_prefix_sum in prefix_sum_count:
            if prev_prefix_sum < prefix_sum:
                star_dense_count += prefix_sum_count[prev_prefix_sum]
            print(f'hello {star_dense_count}')

        # Record the current prefix_sum in the map
        prefix_sum_count[prefix_sum] = prefix_sum_count.get(prefix_sum, 0) + 1

    return star_dense_count  # Output should be 9

print(starmaxxing2([0,1,1,0,1,1]))
# print(starmaxxing2([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]))
# print(starmaxxing2([1,1,1,1]))