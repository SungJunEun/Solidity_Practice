// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract LeftOver {

    function sendLeftOver() public payable returns (bool) {
       (bool success,) =  msg.sender.call{value: address(this).balance}("");
       return success;

    }
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function MYBalance() public view returns (uint) {
        return address(msg.sender).balance;
    }
    // To make contract ETH receivable
    receive() external payable {
    }
}
