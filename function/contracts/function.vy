# @version >=0.3.2

# @notice There are many ways to return output from a function.
# @notice Public Functions cannot accept certain datatypes as inputs or outputs

# @notice Functions can return multiple values
@internal
@pure
def returnMany() -> (uint256, bool, uint256):
    return(1, True, 2)

# @notice Use destructuring assignment when calling another function that returns multiple values
@external
def assigned() -> (uint256, bool, uint256, uint256, uint256):
    i:uint256 = 0
    b:bool = False
    j:uint256 = 0
    x:uint256 = 4
    y:uint256 = 6

    i, b, j = self.returnMany()

    return (i, b, j, x, y)

    # @dev Cannot use HashMap for either input or output
