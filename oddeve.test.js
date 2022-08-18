const { expect } = require("chai");

describe("Storage", function () {
  it("test initial value", async function () {
    // Make sure contract is compiled and artifacts are generated
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'contracts/Dyeus_test/artifacts/OddEve.json'))
    const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner()
    let Storage = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer);
    let storage = await Storage.deploy();
    console.log('storage contract Address: ' + storage.address);
    await storage.deployed()
    expect((await storage.runs())).to.equal(0);
  });

  it("check that transaction is reverted when input greater than input range", async function () {
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'contracts/Dyeus_test/artifacts/OddEve.json'))
    const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner()
    let Storage = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer);
    let storage = await Storage.deploy();
    await storage.deployed()
    await expect(storage.play(9)).to.be.reverted;
  });

  it("check that transaction is reverted when input less than input range", async function () {
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'contracts/Dyeus_test/artifacts/OddEve.json'))
    const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner()
    let Storage = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer);
    let storage = await Storage.deploy();
    await storage.deployed()
    await expect(storage.play(0)).to.be.reverted;
  });

  it("check that game is paused when computer is out", async function () {
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'contracts/Dyeus_test/artifacts/OddEve.json'))
    const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner()
    let Storage = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer);
    let storage = await Storage.deploy();
    await storage.deployed()
    const setValue = await storage.play(2);
    await setValue.wait();
    const compval = await storage.computerInput();
    const returnval = await storage.canPlay();
    if (compval == 0x02){
      return expect(returnval).to.be.false;
    }
    else {
      return expect(returnval).to.be.true;
    }
  });

  it("check that runs in the game are incremented properly", async function () {
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'contracts/Dyeus_test/artifacts/OddEve.json'))
    const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner()
    let Storage = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer);
    let storage = await Storage.deploy();
    await storage.deployed()
    const setValue = await storage.play(2);
    await setValue.wait();
    const compval = await storage.computerInput();
    const returnval = await storage.canPlay();
    const runs = await storage.runs();
    if (compval == 0x02){
      return expect(returnval).to.be.false;
    }
    else {
      return expect(runs).to.equal(compval);
    }
  });

});
