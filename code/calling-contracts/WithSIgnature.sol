// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero, uint256 x, bool y) public {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alert(uint256,bool)", x, y)
        );
        require(success);
    }
}