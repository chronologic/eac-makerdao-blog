const Maker = require('@makerdao/dai');

const maker = Maker.create('kovan', { privateKey: '' });

const createNewCDP = async () => {
  await maker.authenticate();
  const cdp = await maker.getCdp(2754);
  // console.log(cdp);

  // await cdp.lockEth(0.25);
  const collateralVal = await cdp.getCollateralValue(Maker.USD);
  console.log(collateralVal.toString());

  // const tx = await cdp.drawDai(15);

  // console.log(tx);

  const debt = await cdp.getDebtValue();
  console.log(`
DEBT
----
${debt.toString()}`);

//   const id = await cdp.getId();
//   console.log(`
// CDP ID
// ------
// ${id}`);
}

try {
  createNewCDP();
} catch (e) { console.error(e) }
