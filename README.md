# TokenTimeLock Contract

Deploy on polygon mainnet.

https://polygonscan.com/myapikey

npx hardhat compile

npx hardhat run scripts/deploy.ts --network matic

npx hardhat verify --contract contracts/TokenTimeLock.sol:TokenTimeLock --network matic --constructor-args arguments.ts <contracr_address>