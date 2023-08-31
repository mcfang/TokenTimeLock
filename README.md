# TokenTimeLock Contract

Deloy on Polygon

https://polygonscan.com/myapikey

npx hardhat compile

npx hardhat run scripts/deploy.ts --network matic
npx hardhat run scripts/deploy.ts --network polygon_mumbai

npx hardhat verify --contract contracts/TokenTimeLock.sol:TokenTimeLock --network polygon_mumbai --constructor-args arguments.ts <contracr_address>
npx hardhat verify --contract contracts/TokenTimeLock.sol:TokenTimeLock --network matic <contracr_address>