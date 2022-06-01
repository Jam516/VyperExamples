# @version >=0.3.2

# @notice An error will undo all changes made to the state during a transaction
# @notice You can throw an error by calling assert or raise

num: uint256
bbalance: public(uint256)
MAX_UINT: constant(uint256) = 200

@external
@view
def testAssert():
    # @notice assert is used to check for code that should never be false
    # @notice Failing assertion probably means that there is a bug
    assert self.num==0, "num should be 0"

@external
@pure
def testRaise(_i: uint256):
    # @notice raise will trigger an exception and reverts the current call
    if(_i <= 10):
        raise "Input must be greater than 10"

@external
def deposit(_amount: uint256):
    oldBalance:uint256 = self.bbalance
    newBalance: uint256 = self.bbalance + _amount

    # @notice balance + _amount does not overflow if balance + _amount >= balance
    assert newBalance <= MAX_UINT, "Overflow"

    self.bbalance = newBalance

    assert self.bbalance >= oldBalance

@external
def withdraw(_amount: uint256):
    oldBalance: uint256 = self.bbalance

    # @notice balance - _amount does not underflow if balance >= _amount
    if self.bbalance < _amount:
        raise "Underflow"

    self.bbalance -= _amount

    assert self.bbalance <= oldBalance
