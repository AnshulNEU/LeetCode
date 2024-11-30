class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        a = len(flowerbed)
        
        # Count the number of flowers we can plant
        count = 0

        for i in range(a):
            # Check if the current spot is empty, and adjacent spots are empty or out of bounds
            if flowerbed[i] == 0 and (i == 0 or flowerbed[i - 1] == 0) and (i == a - 1 or flowerbed[i + 1] == 0):
                # Plant a flower here
                flowerbed[i] = 1
                count += 1
                
                # If we have planted enough flowers, return True
                if count >= n:
                    return True

        # Return True if we can plant n flowers, otherwise False
        return count >= n
        
