// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Proposal.sol";
import "../../interfaces/IProposalOwner.sol";

contract TransferERC20Proposal is Proposal {

	event ExecuteTransferERC20Transaction(
		uint256 indexed id,
		address indexed executor,
		address indexed toAddress,
		address token,
		uint256 amount
	);

	uint private totalAmount;

	function _execute(uint256 proposalId, bytes memory executionData) internal override {
		(address _token, address to, uint256 value) = abi.decode(executionData,(address, address, uint256));
        bytes memory executeData = abi.encodeWithSelector(IERC20.transfer.selector, to, value);

        IProposalOwner(owner()).executeProposal(_token, executeData, 0);

        emit ExecuteTransferERC20Transaction(proposalId, msg.sender, to, _token, value);
	}
}