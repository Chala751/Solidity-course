// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;

	// track whether an address has voted
	mapping(address => bool) public hasVoted;

	function createVote(Choices choice) external {
		// prevent double voting
		require(!hasVoted[msg.sender], "Already voted");

		// mark as voted
		hasVoted[msg.sender] = true;

		// store vote
		votes.push(Vote(choice, msg.sender));
	}
}