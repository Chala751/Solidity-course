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

		hasVoted[msg.sender] = true;

		votes.push(Vote(choice, msg.sender));
	}

	function changeVote(Choices choice) external {
		// must have voted before
		require(hasVoted[msg.sender], "No existing vote found");

		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == msg.sender) {
				votes[i].choice = choice;
				return;
			}
		}

		revert("Vote not found");
	}

	function findChoice(address user) external view returns (Choices) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == user) {
				return votes[i].choice;
			}
		}

		revert("Vote not found");
	}
}