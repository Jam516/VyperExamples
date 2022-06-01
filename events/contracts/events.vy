# @version >=0.3.2

# @notice Events allow logging on the EVM
# @notice Some use cases for events are:
# - Listening for events and updating user interface
# - A cheap form of storage

"""
@dev This is an event with one data field called value
     Indexed arguments are not part of the event data but can be searched by clients that want to catch the event
     Events do not take state storage and thus do not cost gas
     Events can not be read by contracts only clients
"""
event Transfer:
    sender: indexed(address)
    receiver: indexed(address)
    value: uint256

@external
def transfer(_to : address, _value : uint256):

    # @notice Enter some transfer logic here

    # @notice Log event for listeners
    # @dev msg.sender is an environment variable that gives the address thats making the function call
    log Transfer(msg.sender, _to, _value)
