// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public a;
    uint public b;
    uint public c;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setA(uint _a) public {
        require(msg.sender == owner, "Not owner");
        a = _a;
    }

    function setB(uint _b) public {
        require(msg.sender == owner, "Not owner");
        b = _b;
    }

    function setC(uint _c) public {
        require(msg.sender == owner, "Not owner");
        c = _c;
    }
}