# TokenTimeLock Contract

Deploy on ethereum goerli testnet.

https://https://etherscan.io/myapikey

npx hardhat compile

npx hardhat run scripts/deploy.ts --network goerli

npx hardhat verify --contract contracts/TokenTimeLock.sol:TokenTimeLock --network goerli --constructor-args arguments.ts <contracr_address>