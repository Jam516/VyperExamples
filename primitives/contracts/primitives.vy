# @version >=0.3.2

# @notice An introduction to primitive data types in Vyper

# booleans are true or false
boo: public(bool)

# uint stands for unsigned integer, meaning non negative integers
# different sizes are available
#    uint8   ranges from 0 to 2 ** 8 - 1
#    uint16  ranges from 0 to 2 ** 16 - 1
#    ...
#    uint256 ranges from 0 to 2 ** 256 - 1
u8: public(uint8)
u256: public(uint256)

# Negative numbers are allowed for int types.
# Like uint, different ranges are available from int8 to int256
#    int256 ranges from -2 ** 255 to 2 ** 255 - 1
#    int128 ranges from -2 ** 127 to 2 ** 127 - 1
i8: public(int8)
i256: public(int256)

# The address type holds an Ethereum address.
addr: public(address)

# String[maxLen] can hold a string with length equal to or less than maxLen
str: public(String[100])

# In Vyper, the data type byte represents a sequence of bytes.
# bytesM is a byte array with fixed size M
a: public(bytes4)
b: public(bytes1)

# DynArray[Type, Int] are dynamic arrays of max length Int that hold variables of the datatype Type
list: public(DynArray[int256, 3])

#Unassigned variables have a default value
defaultBoo: public(bool) # false
defaultUint: public(uint256) # 0
defaultInt: public(int256) # 0
defaultAddr: public(address) # 0x0000000000000000000000000000000000000000

# @notice Constructor assigns values to the variables when the contract is deployed
@external
def __init__():
    self.boo = True
    self.u8 = 1
    self.u256 = 456
    self.i8 = -1
    self.i256 = 456
    self.addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c
    self.str = "Test string"
    self.a = 0x01abcdef
    self.b = 0xb5
    self.list.append(42)
    self.list.append(120)
    self.list.append(356)
