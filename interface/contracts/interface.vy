# @version >=0.3.2

"""
@notice
An interface is a set of function definitions used to enable communication between smart contracts
A contract interface defines all of that contract’s externally available functions
By importing the interface, your contract now knows how to call these functions in other contracts
"""

# @notice Interface with the Uniswapv2 factory contract
# @notice That contract is used to create new token pair contracts for swapping on Uniswap
# @notice Through the router we are accessing the getPair() function of the contract which returns the address of a token pair's contract when given the token addresses
# @notice The getPair() function is defined as a view function
interface IUniswapV2Factory:
  def getPair(
    tokenA: address,
    tokenB: address
  ) -> address: view

# @notice Interface with a Uniswapv2 pair contract
# @notice That contract manages a liquidity pool made up of reserves of two ERC-20 tokens
# @notice It allows you to swap one of the pair tokens for the other, following the constant product formula
# @notice Through the router we are accessing the getReserves() function of the contract which returns the amount of each token thats available in the liquidity pool
# @notice The getReserves() function is defined as a view function
interface IUniswapV2Pair:
  def getReserves() -> (uint112, uint112, uint32): view

@external
@view
def getTokenReserves() -> (uint112, uint112):
    factory: address = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
    dai: address = 0x6B175474E89094C44Da98b954EedeAC495271d0F
    weth: address = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2

    # Trader Joe on Avalanche
    # factory: address = 0x9Ad6C38BE94206cA50bb0d90783181662f0Cfa10
    # usdt: address = 0xc7198437980c041c805a1edcba50c1ce5db95118
    # usdc: address = 0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E

    reserve0: uint112 = 0
    reserve1: uint112 = 0
    blockTimestampLast: uint32 = 0

    # @dev Using the factory contract to get the contract of the dai-weth pair
    # @dev Have to pass in the contract of the factory so it can be found
    pair: address = IUniswapV2Factory(factory).getPair(dai, weth)
    (reserve0, reserve1, blockTimestampLast) = IUniswapV2Pair(pair).getReserves()
    return (reserve0, reserve1)
