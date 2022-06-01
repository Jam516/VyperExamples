# @version >=0.3.2

# @notice Introduction to the types of variables in Vyper

# @notice State variables are stored on the blockchain
text: public(String[24])
num: public(uint256)

@external
def doSomething():
    # @notice Local variables are not saved on the blockchain
    i: uint256 = 456

    # @notice Here are some environment variables
    # @notice They are used to get data about the blockchain
    # @var Current block timestamp
    timest: uint256 = block.timestamp
    # @var address of the caller
    sender: address = msg.sender
