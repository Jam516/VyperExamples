# @version >=0.3.2

# @notice Immutable variables can be set inside the constructor (which runs once when the contract is deployed) but cannot be modified afterwards.

# @var Immutable variables to store and address and an integer
MY_ADDRESS: immutable(address)
MY_UINT: immutable(uint256)

# @notice Values are assigned to the immutable variables in the construtor
# @params _myUint is passed to the contstructor
@external
def __init__(_myUint: uint256):
    MY_ADDRESS = msg.sender
    MY_UINT = _myUint
