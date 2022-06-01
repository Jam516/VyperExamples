# @version >=0.3.2

# @notice Functions declared payable can receive ether into the contract

event Payment:
    sender: indexed(address)
    amount: uint256
    bal: uint256

owner: address

# @note Set owner address when the contract is created
@external
def __init__():
    self.owner = msg.sender

# @note Default function is executed on a call to the contract if a non-existing function is called
# or if none is supplied at all, such as when someone sends it Eth directly
# @note The @payable decorator means the function can receive Ether and read from and write to the contract state
@external
@payable
def __default__():
    log Payment(msg.sender, msg.value, self.balance)

# @note Function to withdraw all Ether from this contract
@external
def withdraw():
    # @dev Get amount of ether stored in contract
    _amount:uint256 = self.balance
    # @dev Send all Ether to owner
    log Payment(self, _amount, self.balance)
    send(self.owner, _amount)

# @note Owner can use this method to transfer Eth from contract to an input recipient
@external
def transfer(_to:address, _amount:uint256):
    assert msg.sender == self.owner, "You are not the owner"
    assert _amount < self.balance, "Amount exceeds balance"
    log Payment(self, _amount, self.balance)
    send(_to, _amount)
