// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
        mapping(address => int) votes;
    }

    Proposal[] public proposals;

    mapping(address => bool) public isMember;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    constructor(address[] memory _members) {
        isMember[msg.sender] = true;

        for (uint i = 0; i < _members.length; i++) {
            isMember[_members[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a member");
        _;
    }

    function newProposal(address _target, bytes calldata _data)
        external
        onlyMember
    {
        proposals.push();
        Proposal storage p = proposals[proposals.length - 1];

        p.target = _target;
        p.data = _data;

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support)
        external
        onlyMember
    {
        Proposal storage proposal = proposals[proposalId];

        require(!proposal.executed, "Already executed");

        int previousVote = proposal.votes[msg.sender];
        int newVote = support ? int(1) : int(-1);

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

        emit VoteCast(proposalId, msg.sender);

        //  EXECUTION
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true;

            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
        }
    }
}