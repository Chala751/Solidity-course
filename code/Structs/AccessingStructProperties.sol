// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;

	function createVote(Choices choice) external {
		votes.push(Vote(choice, msg.sender));
	}

	// check if an address has voted
	function hasVoted(address user) external view returns (bool) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == user) {
				return true;
			}
		}
		return false;
	}

	// return the choice made by a specific address
	function findChoice(address user) external view returns (Choices) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == user) {
				return votes[i].choice;
			}
		}
		revert("Vote not found");
	}
}