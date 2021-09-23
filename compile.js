const path = require('path');
const fs = require('fs');
const solc = require('solc');

const taskPath = path.resolve(__dirname, 'contracts', 'firstTask.sol');
const source = fs.readFileSync(taskPath, 'utf8');

module.exports = solc.compile(source, 1).contracts[':firstTask'];
