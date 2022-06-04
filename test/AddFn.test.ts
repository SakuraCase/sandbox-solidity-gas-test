import { ethers } from "hardhat";

describe("AddFn", () => {
  it("test", async function () {
    const [owner] = await ethers.getSigners();
    const factory = await ethers.getContractFactory("AddFn", owner);
    const contract = await factory.deploy();
    await contract.deployed();

    await contract.test(1, 2);
  });

  it("test2", async function () {
    const [owner] = await ethers.getSigners();
    const factory = await ethers.getContractFactory("AddFn", owner);
    const contract = await factory.deploy();
    await contract.deployed();

    await contract.test2(1, 2);
    await contract.test3(1, 2);
  });
});