# @version >=0.3.2

# @notice Constants are variables that cannot be modified. Their value is hard coded and using constants can save gas cost.

# @notice It is convention to name constant variables in uppercase
MY_ADDRESS: constant(address) = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc
MY_UINT: constant(uint256) = 123

user: public(address)
total_supply: public(uint256)

# @notice Assigning the constants to the public variables so we can view them by calling user() and total_supply()
@external
def __init__():
    self.user = MY_ADDRESS
    self.total_supply = MY_UINT
