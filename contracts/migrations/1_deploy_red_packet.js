const ETHReceiver = artifacts.require("ETHReceiver");

module.exports = function (deployer) {
  deployer.deploy(ETHReceiver);
};
