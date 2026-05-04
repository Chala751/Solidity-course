// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(users[msg.sender].isActive == false, "User already exists");

        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    function transfer(address _to, uint _amount) external {
        // both users must exist
        require(users[msg.sender].isActive, "Sender not active");
        require(users[_to].isActive, "Recipient not active");

        // must have enough balance
        require(users[msg.sender].balance >= _amount, "Insufficient balance");

        // perform transfer
        users[msg.sender].balance -= _amount;
        users[_to].balance += _amount;
    }
}