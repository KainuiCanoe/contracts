pragma solidity ^0.4.0;

import './KAIToken.sol';

contract KAIFounderToken is KAIToken {
    string public constant name = "KAI-F Token";
    string public constant symbol = "KAI-F";
    uint256 public constant totalSupply = 888888; // Eight Hundred Eighty Eight Thousand, Eight Hundred Eighty Eight (10%)
    uint256 public circulating = 0;

    function KAIFounderToken() KAIToken() {

    }

    // Transfer the balance from owner's account to another account
    function transfer(address toAccount, uint256 amount) returns (bool success) {
        if (balances[msg.sender] >= amount
        && amount > 0
        && balances[toAccount] + amount > balances[toAccount]) {
            balances[msg.sender] -= amount;
            balances[toAccount] += amount;
            circulating += amount;
            /* Notify anyone listening that this transfer took place */
            Transfer(msg.sender, toAccount, amount);
            return true;
        } else {
            return false;
        }
    }
}
