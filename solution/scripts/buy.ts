import {ethers} from "hardhat";
import {EasyAToken} from "../typechain-types";

const main = async () => {
    const EasyATokenFactory = await ethers.getContractFactory("EasyAToken");
    const easyAToken = EasyATokenFactory.attach("0x88Ffc40EA1Ae9E504bBec4D6412A328B865c9bAc") as EasyAToken;

    const transaction = await easyAToken.buy({
        value: ethers.parseEther("1"),
    });

    await transaction.wait(1);
}

main();