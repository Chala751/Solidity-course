// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Mage is Hero(50) {
    // inherits everything, sets health = 50
}

contract Warrior is Hero(200) {
    // inherits everything, sets health = 200
}   
