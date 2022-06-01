# @version >=0.3.2

# @notice Depending on where they are declared, variables are stored in different locations
# @notice Storage - variable is a state variable (store on blockchain). Initial value cannot be set
# @notice Memory - Variable is in memory and it exists while a function is being called. Initial value must be set
# @notice Calldata - Special data location that contains function arguments. A default value may be given

arr: public(DynArray[uint256, 20])
# @dev A hashmap can only be declared as a storage variable
map: HashMap[uint256, address]
struct MyStruct:
    foo: uint256
myStructs: public(HashMap[uint256, MyStruct])

# @dev Internal functions are only accessible from other functions within the same contract.
# @dev They are called via the self object
@internal
def _f(_arr: DynArray[uint256, 20]):
    # Do something with storage variable arr
    _len: uint256 = len(_arr)

# @dev External functions are a part of the contract interface and may only be called via transactions or from other contracts.
# @dev A Vyper contract cannot call directly between two external functions
@external
def f(i: uint256):
 self.arr.append(i)
 # @notice Call _f() with state variable arr
 # @dev For this to work _f() has to be declared before f()
 # @dev Functions cant call functions later in the code than themselves
 self._f(self.arr)

 # @notice Create a struct in Memory
 myMemStruct: MyStruct = MyStruct({foo: 0})

# @dev You can return memory variables
@external
def g(_arr: DynArray[uint256, 20]) -> DynArray[uint256, 20]:
    # Do something with memory array _arr. Note that you cant write to calldata .eg. do _arr[0]
    _array: DynArray[uint256, 20] = _arr
    _array[0] = 42
    return _array

@external
def h(_arr: DynArray[uint256, 20]) -> uint256:
    # Do something with calldata array
    _x: uint256 = len(_arr)
    return _x
