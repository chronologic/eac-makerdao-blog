const { expect } = require('chai');
const { KOVAN } = require('./helpers/consts');

const SaveDangerousCdp = artifacts.require('Save_Dangerous_CDP.sol');

contract("Save_Dangerous_CDP", () => {
  let saveDangerousCdp;
  
  it('correctly deploys', async () => {
    saveDangerousCdp = await SaveDangerousCdp.new(
      "0x" + "0".repeat(60) + "0AD3",
      KOVAN.TIMESTAMP_SCHEDULER,
      KOVAN.TUB,
    );
    expect(saveDangerousCdp.address).to.exist; 
    console.log(await saveDangerousCdp.cdpId());
    console.log(await saveDangerousCdp.ownerOfCdp()); 
  })
})