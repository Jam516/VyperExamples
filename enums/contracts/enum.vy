# @version >=0.3.4

# @notice Enums are custom defined types.
# @notice An enum must have at least 1 member, and can hold up to a maximum of 256 members.


# @notice Defining an enum with two members
enum Status:
    REGULAR
    VIP
    BLACKLISTED

# @notice Mapping from user addresses to statuses
# @notice Default value is first element in the enum. Here it is REGULAR
user_statuses: HashMap[address, Status]

# Members are represented by uint256 values in the form of 2^n
# n is the index of the member in the range
# REGULAR - 1
# VIP - 2
# BLACKLISTED - 4

# @notice Get the status of the user
@external
@view
def get(_addr: address) -> Status:
    return self.user_statuses[_addr]

# @notice Set the status of a user by passing in a uint
@external
def set(_addr: address, _status: Status):
    self.user_statuses[_addr] = _status

# @notice Reset the status of a user to REGULAR
@external
def reset(_addr: address):
    self.user_statuses[_addr] = Status.REGULAR
