pragma solidity ^0.4.0;

import './KAIToken.sol';

contract KAIInvestorToken is KAIToken {
    string public constant name = "KAI-I Token";
    string public constant symbol = "KAI-I";
    uint256 public constant totalSupply = 2666667; // Two Million, Six Hundred Sixty Six Thousand, Six Hundred Sixty Seven (30%)
    uint256 public circulating = 0;
    uint256 public buyPrice = 0;

    function KAIInvestorToken() KAIToken() {

    }

    function buy() payable returns (uint amount) {
        amount = msg.value / buyPrice;        // calculates the amount
        require((circulating + amount <= totalSupply) && (balanceOf[this] >= amount);    // checks if it has enough to sell
        balanceOf[msg.sender] += amount;      // adds the amount to buyer's balance
        balanceOf[this] -= amount;            // subtracts amount from seller's balance
        circulating += amount;
        Transfer(this, msg.sender, amount);   // execute an event reflecting the change
        return amount;
    }

}
