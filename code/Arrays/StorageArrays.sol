// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    uint[] public evenNumbers;

    function filterEven(uint[] calldata arr) external {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenNumbers.push(arr[i]);
            }
        }
    }
}