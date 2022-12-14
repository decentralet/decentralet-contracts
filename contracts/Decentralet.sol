// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Decentralet is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    struct InitializeParams {
        address _walletImplementation;
    }

    address public walletImplementation;

    mapping(address => bool) public wallets;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(InitializeParams calldata params) external initializer {
        __Ownable_init();
        upgradeImplementations(params);
    }

    function upgradeImplementations(InitializeParams calldata params)
        public
        onlyOwner
    {
        address _walletImplementation = params._walletImplementation;
        require(
            _walletImplementation != address(0),
            "Invalid constructor parameter"
        );
        walletImplementation = _walletImplementation;
    }

    // This function should revert when `msg.sender` is not authorized to upgrade the contract.
    // It's called by {upgradeTo} and {upgradeToAndCall} in UUPSUpgradeable.
    function _authorizeUpgrade(address) internal view override onlyOwner {}

    uint256[50] private __gap;
}
