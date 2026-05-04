// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    //  1. Create proposals array
    Proposal[] public proposals;

    //  2. Create newProposal function
    function newProposal(address _target, bytes calldata _data) external {
        
        //  3. Create new proposal with 0 votes
        Proposal memory newProp = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });

        //  4. Add to array
        proposals.push(newProp);
    }
}