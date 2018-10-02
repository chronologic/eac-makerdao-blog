const Maker = require('@makerdao/dai');

const maker = Maker.create('kovan', { privateKey: process.env.PK });

const checkCollaterization = async () => {
  await maker.authenticate();

  const cdp = await maker.getCdp(2771);

  const colRat = await cdp.getCollateralizationRatio();

  console.log(colRat);
}

try {
  checkCollaterization();
} catch (e) { console.error(e) }