const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    const TOR1 = await ethers.getContractFactory('TokenTimeLock');
    const totalNumber = ethers.BigNumber.from("200000000000000000");
    const perNumber = ethers.BigNumber.from("7920278400000000");
    const tor1 = await TOR1.deploy('token_address', totalNumber, perNumber, [1693473400, 1693474400, 1693475400, 1693476400, 1693477400]);
    console.log('Contract deployed to address:', tor1.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });