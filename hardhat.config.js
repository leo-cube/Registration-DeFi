require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require("@openzeppelin/hardhat-upgrades");
require("dotenv").config();

const {DEPLOYER_PVT_AD, ES_API, ES_API_POLYSCAN, P_MAINNET, P_MUMBAI, GOERLI} = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks:{
    polygon_mainnet: {
      url:P_MAINNET,  
      accounts: [DEPLOYER_PVT_AD],
    },
    mumbai: {
      url:P_MUMBAI,   
      accounts: [DEPLOYER_PVT_AD],
      gas: 2100000,
      gasPrice: 8000000000
    },
    goerli: {
      url:GOERLI,  
      accounts: [DEPLOYER_PVT_AD],
      gas: 2100000,
      gasPrice: 8000000000
    }
  },
  etherscan : {
    apiKey : {
      polygonMumbai:ES_API_POLYSCAN,
      goerli:ES_API
    },
  },
  mocha: {
    timeout: 160000
  }
};