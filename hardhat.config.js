/** @type import('hardhat/config').HardhatUserConfig */
require('@nomicfoundation/hardhat-toolbox');

require('./tasks/export');
require('./tasks/generateInterface');

module.exports = {
  solidity: "0.8.17",
};
