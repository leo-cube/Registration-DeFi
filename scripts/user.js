const {ethers} = require("hardhat");

async function deployAdmin(){
    console.log("Deploying the User smart contract to the blockchain");
    const baseC = await ethers.getContractFactory("contracts/User.sol:User");
    const deployC = await baseC.deploy();
    await deployC.deployed();
    console.log("The deployed User contract address is ", deployC.address);
}

deployAdmin();
