// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

abstract contract Proposal is Initializable, OwnableUpgradeable {
    uint private id;
		bytes private executionData;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

		function execute() public onlyOwner {
			_execute(id, executionData);
		}

		function _execute(uint256, bytes memory) internal virtual;
}
