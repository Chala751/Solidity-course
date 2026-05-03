// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) public {
        (bool success, ) = hero.call(
            abi.encodePacked(bytes4(0x12345678))
        );
        require(success);
    }
}