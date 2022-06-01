# @version >=0.3.2

# @notice In a Nested Mapping the Value is another mapping

nested: public(HashMap[address, HashMap[uint256, bool]])

# @notice Retrieve the mapping for this address
@external
@view
def get(_addr1: address, _i: uint256) -> bool:
    # @dev You can get values from a nested mapping even when its not initialized
    return self.nested[_addr1][_i]

# @notice Update the mapping for this address
@external
def set(_addr1: address, _i: uint256, _boo: bool):
    self.nested[_addr1][_i] = _boo
