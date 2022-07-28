# @version >=0.3.4

# @notice Enums are custom defined types.
# @notice An enum must have at least 1 member, and can hold up to a maximum of 256 members.


# @notice Defining an enum with two members
enum Status:
    REGULAR
    VIP
    BLACKLISTED

# @var Default value is first element in the enum. Here it is REGULAR
user_status: Status

# Members are represented by uint256 values in the form of 2^n
# n is the index of the member in the range
# REGULAR - 1
# VIP - 2
# BLACKLISTED - 4

# @notice Get the status of the user
@external
def get() -> Status:
    return self.user_status

# @notice Set the status of the user by passing in a uint
@external
def set(_status: Status):
    self.user_status = _status

# # @notice Reset the status of the user to REGULAR
# @external
# def reset():
#     self.user_status = Status.REGULAR
