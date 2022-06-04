import { ethers } from "hardhat";

describe("Add256", () => {
  it("test", async function () {
    const [owner] = await ethers.getSigners();
    const factory = await ethers.getContractFactory("Add256", owner);
    const contract = await factory.deploy();
    await contract.deployed();

    await contract.test(1, 2);
  });
});