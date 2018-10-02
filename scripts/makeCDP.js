const Maker = require('@makerdao/dai');

const maker = Maker.create('kovan', { privateKey: process.env.PK });

const createNewCDP = async () => {
  await maker.authenticate();
  // const cdp = await maker.openCdp();
  const cdp = await maker.getCdp(2771);

  // console.log('Opened new CDP! CDP ID - ' + await cdp.getId());
  console.log('Locking away 0.25 eth...');
  await cdp.lockEth(0.25);

  const collateralVal = await cdp.getCollateralValue(Maker.USD);
  console.log('Collateral value - ' + collateralVal.toString());

  console.log('Attempting to draw 8 dai...');
  await cdp.drawDai(8);

  const debt = await cdp.getDebtValue();
  console.log('DEBT - ' + await cdp.getDebtValue());
}

try {
  createNewCDP();
} catch (e) { console.error(e) }
