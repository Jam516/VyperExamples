# @version >=0.3.2

# @notice To write or update a state variable you need to send a transaction.
# On the other hand, you can read state variables, for free, without any transaction fee.

# @var State variable to store a number
num: public(uint256)

# @notice You need to send a transaction to write to a state variable
@external
def set(_num: uint256):
  self.num = _num

# @notice You can read from a state variable without sending a transaction
@external
@view
def get() -> uint256:
    return self.num
