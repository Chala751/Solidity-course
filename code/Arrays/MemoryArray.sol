// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    function filterEven(uint[] calldata arr) external pure returns (uint[] memory) {
        uint count = 0;

        // First pass: count even numbers
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                count++;
            }
        }

        // Create memory array with exact size
        uint[] memory result = new uint[](count);

        uint index = 0;

        // Second pass: store even numbers
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                result[index] = arr[i];
                index++;
            }
        }

        return result;
    }
}