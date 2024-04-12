// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

struct Proposal {
    string title;
    uint endBlock;
    uint yeas;
    uint noes;
}

contract Voting {
    event ProposalCreated(uint id);

    ERC20 public votingToken;
    mapping(uint => Proposal) public proposals;
    uint public proposalCounter = 0;

    constructor(address tokenAddress) {
        votingToken = ERC20(tokenAddress);
    }

    function createProposal(string memory title, uint endBlock) public  {
        require(bytes(title).length > 0, "title is empty");
        require(endBlock > block.number, "endBlock is in the past");

        uint proposalId = proposalCounter;
        proposals[proposalId] = Proposal({
            title: title,
            endBlock : endBlock,
            yeas: 0,
            noes: 0
        });

        proposalCounter++;
        emit ProposalCreated(proposalId);
    }

    function voteYes(uint proposalId) public {
        Proposal storage proposal = proposals[proposalId];

        require(proposal.endBlock > block.number, "proposal already ended");
        proposal.yeas = proposal.yeas + votingToken.balanceOf(msg.sender);
    }

    function voteNo(uint proposalId) public {
        Proposal storage proposal = proposals[proposalId];

        require(proposal.endBlock < block.number, "proposal already ended");
        proposal.noes = proposal.noes + votingToken.balanceOf(msg.sender);
    }

    function passed(uint proposalId) public view returns(bool) {
        Proposal storage proposal = proposals[proposalId];
        require(proposal.endBlock <= block.number, "proposal not ended");
        return proposal.yeas > proposal.noes;
    }
}
