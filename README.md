# TokenTimeLock Contract

Deploy on ethereum mainnet.

https://https://etherscan.io/myapikey

npx hardhat compile

npx hardhat run scripts/deploy.ts --network mainnet

npx hardhat verify --contract contracts/TokenTimeLock.sol:TokenTimeLock --network mainnet --constructor-args arguments.ts <contracr_address>