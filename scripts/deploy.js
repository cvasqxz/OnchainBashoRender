const hre = require("hardhat");

async function main() {
  const contract = await hre.ethers.getContractFactory("OnchainBashoRender");
  const render = await contract.deploy();

  await render.deployed();

  tokenURI = await render.tokenURI();
  console.log(tokenURI);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });