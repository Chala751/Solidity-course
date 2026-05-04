// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    enum ConnectionTypes {
        Unacquainted,
        Friend,
        Family,
        Colleague
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address _user, ConnectionTypes _type) external {
        connections[msg.sender][_user] = _type;
    }
}