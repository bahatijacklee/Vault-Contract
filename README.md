# 🔐 Vault System Smart Contract

A secure and modular Ethereum smart contract system that allows users to **deposit** and **withdraw** Ether (ETH). Designed with **inheritance**, **custom math library**, and robust **security checks**.

---

## 📦 Features

- ✅ Users can deposit ETH into their personal vault
- ✅ Users can withdraw ETH (up to their balance)
- 🧮 Uses a custom SafeMath library for arithmetic operations
- 🚫 Prevents over-withdrawals and zero-value deposits
- 🪙 Emits `Deposit` and `Withdraw` events
- 🧱 Modular design using inheritance:
  - `VaultBase` — abstract base contract
  - `VaultManager` — derived contract with core logic

---

## 🧠 Contract Structure

### 📂 Library: `SafeMathLib`

Provides safe arithmetic operations:
```solidity
add(uint a, uint b)
sub(uint a, uint b)
````

---

### 🏗️ Base Contract: `VaultBase`

Holds:

* Balances mapping
* Events: `Deposit`, `Withdraw`
* `getBalance()` view function

---

### 🛠️ Derived Contract: `VaultManager`

Implements:

* `deposit()` – deposits ETH into sender's vault
* `withdraw(uint amount)` – withdraws ETH from sender's vault

---

## 📜 Functions Summary

| Function                                                     | Visibility             | Description                                   |
| ------------------------------------------------------------ | ---------------------- | --------------------------------------------- |
| `deposit()`                                                  | external, payable      | Accepts ETH deposits and updates user balance |
| `withdraw(uint amount)`                                      | external               | Withdraws ETH if balance allows               |
| `getBalance(address user)`                                   | public view            | Returns balance of specified address          |
| Events: `Deposit(address, uint)` / `Withdraw(address, uint)` | emitted on ETH actions |                                               |

---

## 🔐 Security & Validations

* ✅ `require(msg.value > 0)` in `deposit()` to prevent null deposits
* ✅ `require(balances[msg.sender] >= amount)` in `withdraw()` to prevent overdraw
* ✅ `SafeMathLib` ensures safe arithmetic
* ✅ Follows Checks-Effects-Interactions pattern

---

## 🚀 Deployment

### Remix

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Paste the contract into a new `.sol` file
3. Compile with Solidity 0.8.20+
4. Deploy `VaultManager`

### Hardhat/Truffle

Use standard deployment scripts. Make sure to import the contract and compile with matching compiler version.

---

## 📂 File Structure

```
VaultSystem/
│
├── contracts/
│   ├── VaultManager.sol
│   └── VaultBase.sol
│   └── SafeMathLib.sol
├── README.md
└── [LICENSE]
```

---

## 👨‍💻 Author

**Bahati Jacklee**
GitHub: [@bahatijacklee](https://github.com/bahatijacklee)

---

## 📝 License

This project is licensed under the [MIT License](LICENSE)

---

## 🙋‍♂️ Contributions

Feel free to fork, improve, or submit pull requests. Feedback is welcome!

