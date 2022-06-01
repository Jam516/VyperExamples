# @version >=0.3.2

# @notice Introduction to conditional statements

# @notice @pure functions can not read or alter state.
# They can't access state variables or global variables or not pure functions
@external
@pure
def foo(x:uint256) -> uint256:
    if (x < 10):
        return 0
    elif (x < 20):
        return 1
    else:
        return 2
