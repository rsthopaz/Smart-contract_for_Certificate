const hre = require("hardhat");

async function main() {
  const ContractFactory = await hre.ethers.getContractFactory("Certificate");
  const contract = await ContractFactory.deploy();
  await contract.waitForDeployment();
  console.log("Contract address: ", await contract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});