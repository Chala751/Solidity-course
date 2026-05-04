// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => int) votes;
    }

    Proposal[] public proposals;

    function newProposal(address _target, bytes calldata _data) external {
        proposals.push();
        Proposal storage p = proposals[proposals.length - 1];
        p.target = _target;
        p.data = _data;
    }

    function castVote(uint proposalId, bool support) external {
        Proposal storage proposal = proposals[proposalId];

        int previousVote = proposal.votes[msg.sender];
        int newVote = support ? int(1) : int(-1);

        if (previousVote == newVote) return;

        if (previousVote == 1) {
            proposal.yesCount--;
        } else if (previousVote == -1) {
            proposal.noCount--;
        }

        if (newVote == 1) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        proposal.votes[msg.sender] = newVote;
    }
}