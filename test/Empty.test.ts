import { ethers } from "hardhat";

describe("Empty", () => {
  it("can deploy", async function () {
    const [owner] = await ethers.getSigners();
    const Empty = await ethers.getContractFactory("Empty", owner);
    const empty = await Empty.deploy();
    await empty.deployed();
  });
});