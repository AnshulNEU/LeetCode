class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # last index each chac appears at
        last = {c: i for i, c in enumerate(s)}

        result=[]
        start=0 
        end =0


        for i, c in enumerate(s):
            end = max(end, last[c])
            if i == end: # we reach the end of the boundary 
                result.append(end - start +1)
                start = i+1

        return result