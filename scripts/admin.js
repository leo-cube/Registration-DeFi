const {ethers} = require("hardhat");

async function deployAdmin(){
    console.log("Deploying the Admin smart contract to the blockchain");
    const baseC = await ethers.getContractFactory("contracts/Admin.sol:Admin");
    const deployC = await upgrades.deployProxy(baseC);
    await deployC.deployed();
    console.log("The deployed Admin proxy contract address is ", deployC.address);
}

deployAdmin();
