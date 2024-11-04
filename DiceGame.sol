/**
 *Submitted for verification at basescan.org on 2024-11-04
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiceGame {
    mapping(address => uint256) public scores;
    event DiceRolled(address indexed player, uint256 result);

    function rollDice() public returns (uint256) {
        uint256 result = (uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 6) + 1;
        scores[msg.sender] += result;
        emit DiceRolled(msg.sender, result);
        return result;
    }

    function getScore() public view returns (uint256) {
        return scores[msg.sender];
    }
}
