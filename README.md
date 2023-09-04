# TokenTimeLock Contract

Deploy on polygon mumbai testnet.

https://polygonscan.com/myapikey

npx hardhat compile

npx hardhat run scripts/deploy.ts --network polygon_mumbai

npx hardhat verify --contract contracts/TokenTimeLock.sol:TokenTimeLock --network polygon_mumbai --constructor-args arguments.ts <contracr_address>