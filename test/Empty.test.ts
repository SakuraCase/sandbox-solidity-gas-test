import { ethers } from "hardhat";

describe("Empty", () => {
  it("can deploy", async function () {
    const [owner] = await ethers.getSigners();
    const factory = await ethers.getContractFactory("Empty", owner);
    const contract = await factory.deploy();
    await contract.deployed();
  });
});