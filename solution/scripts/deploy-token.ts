import {ethers} from "hardhat";

const main = async () => {
    const EasyATokenFactory = await ethers.getContractFactory("EasyAToken");
    const easyAToken = await EasyATokenFactory.deploy();
    const easyATokenAddress = await easyAToken.getAddress();

    console.log("EasyAToken address: ", easyATokenAddress);
}

main();