# @version >=0.3.2

# @notice Maps are created with syntax HashMap[_KeyType, _ValueType]
# @notice The KeyType can be any base or bytes type
# @notice Mappings, interfaces and structs cannot be key types
# @notice ValueType can be any type including another mapping
# @notice Mappings are not iterable. They can only be declared as state variables

# @notice Mapping from address to uint
myMap: public(HashMap[address, uint256])

# @notice Retrieve the value for this address
@external
@view
def get(_addr: address) -> uint256:
    # @dev Mapping always returns a value. If the value was never set, it will return the default value
    return self.myMap[_addr]

# @notice Update the value for this address
@external
def set(_addr: address, _i: uint256):
    self.myMap[_addr] = _i
