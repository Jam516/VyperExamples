# @version >=0.3.2

# @notice Fixed-size lists hold a finite number of elements which belong to a specified type
# @notice Dynamic arrays are arrays whose length can be modified up to a limit specified in the declaration

# @var A dynamic array with a maximum length of 20
arr: DynArray[uint256, 20]
# @var A list with a fixed size of 10
myFixedSizeList: uint256[10]

@external
@view
def get(i: uint256) -> uint256:
    return self.arr[i]

# @notice Returns the entire array
@external
@view
def getArr() -> DynArray[uint256, 20]:
    return self.arr

# @notice Adds a new value to the array
@external
def append(i: uint256):
    # @dev Increases length of the Dynamic array by 1 by adding a new value to it
    self.arr.append(i)

# @notice Removes the last element in the array
@external
def popArr():
    # @dev Decreases array length by 1
    self.arr.pop()

# @notice Returns the length of the array
@external
@view
def getLength() -> uint256:
    return len(self.arr)

# @notice Remove array element by replacing it with the last element
@external
def removeReplaceFromEnd(_index: uint256):
    _x: uint256 = convert(len(self.arr), uint256)
    assert _index < _x, "index out of bound"

    # @dev [1, 2, 3, 4] -- remove(1) --> [1,4,3]
    self.arr[_index] = self.arr[len(self.arr) - 1]
    self.arr.pop()
