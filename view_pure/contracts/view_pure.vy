# @version >=0.3.2

# @notice Getter functions can be declared view or pure
# @notice @view functions cannot change state variables
# @notice @pure functions cannot read or change state variables

x: public(uint256)

# @notice Using the constructor to set the value of x when contract is deployed
@external
def __init__():
    self.x = 1

# @notice Promise not to modify the state
@external
@view
def addToX(y:uint256) -> uint256:
  return self.x + y

# @notice Promise not to modify or read from the state
@external
@pure
def addPure(i:uint256, j:uint256) -> uint256:
    return i+j
