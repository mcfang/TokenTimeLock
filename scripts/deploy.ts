const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    const TOR1 = await ethers.getContractFactory('TokenTimeLock');
    const totalNumber = ethers.BigNumber.from("200000000000000000");
    const perNumber = ethers.BigNumber.from("7920278400000000");
    const tor1 = await TOR1.deploy('token_address', totalNumber, perNumber, [1693884600, 1693884700, 1693884800, 1693884900]);
    console.log('Contract deployed to address:', tor1.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });