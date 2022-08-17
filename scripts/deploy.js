const hre = require("hardhat");

async function main() {
  const contract = await hre.ethers.getContractFactory("OnchainBashoRender");
  const render = await contract.deploy();

  await render.deployed();

  await render.addAbasho(
    ethers.utils.toUtf8Bytes("0000000000000000000000000000000000000000011110000000000011111100000000001222210000000000042421100000000002222210001110000266211001242000255550000122600000555000005555200033200000255000003330000055500000404000002020000000000000000000000000000000000000000000"),
    "base")

  tokenURI = await render.tokenURI(0);
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