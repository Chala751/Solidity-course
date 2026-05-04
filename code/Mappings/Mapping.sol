// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    
    // mapping from address => membership status
    mapping(address => bool) public members;

    // add a new member
    function addMember(address _addr) external {
        members[_addr] = true;
    }
}