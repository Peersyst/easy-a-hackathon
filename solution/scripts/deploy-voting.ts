import {ethers} from "hardhat";

const main = async () => {
    const VotingFactory = await ethers.getContractFactory("Voting");
    const voting = await VotingFactory.deploy("0x88Ffc40EA1Ae9E504bBec4D6412A328B865c9bAc");
    const votingAddress = await voting.getAddress();

    console.log("Voting address: ", votingAddress);
}

main();