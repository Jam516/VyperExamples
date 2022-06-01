# @version >=0.3.2

# @notice Vyper supports for loops

@external
def loop():
    # @dev You could also use for i in [0,1,2,3,4,5,6,7,8,9]
    for i in range(10):
        if (i == 3):
            # @dev Skip to the next interaction with continue
            continue
        if (i == 5):
            # @dev Exit loop with break
            break
