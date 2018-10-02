const keyeth = require('keythereum');
const ethUtil = require('ethereumjs-util');

const key = keyeth.create();

const pk = key.privateKey.toString('hex');

const addr = ethUtil.privateToAddress(Buffer.from(pk, 'hex'));

console.log('Address - ' + addr.toString('hex'));
console.log('Private Key - ' + pk);
