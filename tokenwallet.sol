// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenWallet {
    mapping(address => uint) public balances;

    event Deposit(address indexed sender, uint amount);
    event Withdraw(address indexed receiver, uint amount);

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
        emit Withdraw(msg.sender, amount);
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
