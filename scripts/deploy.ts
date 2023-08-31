const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    const TOR1 = await ethers.getContractFactory('TokenTimeLock');
    const tor1 = await TOR1.deploy('token_address', 10000000000, 1000000000, 1693472400, [1693473400, 1693474400, 1693475400, 1693476400, 1693477400]);
    console.log('Contract deployed to address:', tor1.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });