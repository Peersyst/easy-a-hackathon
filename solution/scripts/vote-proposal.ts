import {ethers} from "hardhat";
import {EasyAToken, Voting} from "../typechain-types";

const main = async () => {
    const VotingFactory = await ethers.getContractFactory("Voting");
    const voting = VotingFactory.attach("0xD1A2A5AeDfDF5C2d7d33d9687784Ec9b8aaCacaD") as Voting;

    const transaction = await voting.voteYes(0);
    await transaction.wait(1);
}

main();