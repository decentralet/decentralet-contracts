// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

contract ProposalOwner {
	mapping(uint => bool) proposals;

	function executeProposal(address _to, bytes memory _data, uint256 _value) external returns (bytes memory) {
        (bool success, bytes memory result) = _to.call{ value: _value }(_data);
        if(!success) {
            revert("Proposal execution is unsuccessful");
        }

        return result;
    }
}