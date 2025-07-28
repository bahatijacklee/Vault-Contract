 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SafeMathLib – Safe arithmetic for uint256
library SafeMathLib {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, SafeMath: addition overflow);
        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, SafeMath: subtraction underflow);
        return a - b;
    }
}

/// @title VaultBase – holds balances, events and shared logic
abstract contract VaultBase {
    // user address → deposited balance
    mapping(address => uint256) internal balances;

    /// @dev Emitted when  deposits  wei
    event Deposit(address indexed user, uint256 amount);

    /// @dev Emitted when  withdraws  wei
    event Withdraw(address indexed user, uint256 amount);

    /// @notice Get the current balance of any user
    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}

/// @title VaultManager – users’ deposit & withdrawal implementation
contract VaultManager is VaultBase {
    using SafeMathLib for uint256;

    /// @notice Deposit ETH into your vault
    function deposit() external payable {
        require(msg.value > 0, Cannot deposit 0);
        // safe add
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    /// @notice Withdraw up to your deposited balance
    /// @param amount Wei amount to withdraw
    function withdraw(uint256 amount) external {
        require(amount > 0, Cannot withdraw 0);
        // safe sub (will revert if amount > balance)
        balances[msg.sender] = balances[msg.sender].sub(amount);
        // transfer after effects
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }
} 
