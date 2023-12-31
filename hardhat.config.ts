require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

module.exports = {
  defaultNetwork: "mainnet",
  networks: {
    hardhat: {
    },
    mainnet: {
      url: "https://rpc.ankr.com/eth",
      accounts: ["private_key"]
    }
  },
  etherscan: {
    apiKey: "api_key"
  },
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
}