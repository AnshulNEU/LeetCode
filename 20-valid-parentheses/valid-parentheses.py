class Solution:
    def isValid(self, s: str) -> bool:
        stack = []  # Stack to hold opening brackets
        pairs = {')': '(', ']': '[', '}': '{'}  # Mapping of closing to opening

        for ch in s:
            if ch in pairs:
                # If stack is empty or top doesn't match, it's invalid
                if not stack or stack.pop() != pairs[ch]:
                    return False
            else:
                stack.append(ch)  # Push opening brackets to stack

        return not stack  # Return True only if all brackets closed