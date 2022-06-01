# @version >=0.3.2

# @notice Simple contract for getting, incrementing and decrementing a counter

# @var The counter
# @dev Vyper automatically creates a getter method when you set a variable as public. We don't even really need the get() function
# @dev uint256 is set to the default value of 0 when the contract is deployed
counter: public(uint256)

# @notice Returns the counter
# @return The current count
@external
@view
def get() -> uint256:
    return self.counter

# @notice Increment count by 1
@external
def inc():
    self.counter += 1

# @notice Decrement count by 1
# @dev Will fail if count is 0
@external
def dec():
    self.counter -= 1
