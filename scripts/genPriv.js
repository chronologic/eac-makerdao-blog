const keyeth = require('keythereum');
const ethUtil = require('ethereumjs-util');

// const keyObj = keyeth.create();

// console.log(keyObj.privateKey.toString('hex'));

const addr = ethUtil.privateToAddress(Buffer.from('1461ed40d033bc72941f232cff50e72d5b452b864625e694eeac210069f93af5', 'hex'));

console.log(addr.toString('hex'));

