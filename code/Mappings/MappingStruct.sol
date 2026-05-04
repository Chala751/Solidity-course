// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        // security check: prevent double creation
        require(users[msg.sender].isActive == false, "User already exists");

        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }
}