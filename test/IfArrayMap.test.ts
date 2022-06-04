import { ethers } from "hardhat";

describe("IfArrayMap", () => {
  it("test", async function () {
    const [owner] = await ethers.getSigners();
    const factory = await ethers.getContractFactory("IfArrayMap", owner);
    const contract = await factory.deploy();
    await contract.deployed();

    await contract.arr(0);
    await contract.map(0);
    await contract.test(1, 2);
    await contract.test2(1, 2);
    await contract.test3(1, 2);
  });
});