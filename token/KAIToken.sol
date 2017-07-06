pragma solidity ^0.4.0;

import './ERC20Token.sol';
import './Owned.sol';

/*
    Abstract Token for managing KAI Coins
*/
contract KAIToken is Owned, ERC20Token {
    string public constant name = "KAI Token";
    string public constant symbol = "KAI";
    uint256 public constant totalSupply = 8888888; // 8 Million, 8 Hundred Eighty Eight Thousand, 8 Hundred Eighty Eight
    uint256 public circulating = 0;
    uint256 public sellPrice = 0;

    uint public constant creationTime;

    mapping(address => bool) public frozenAccounts;

    event FrozenFunds(address account, bool frozen);

    function KAIToken() {
        creationTime = now;
    }

    // Transfer the balance from owner's account to another account
    function transfer(address toAccount, uint256 amount) returns (bool success) {
        require(!frozenAccounts[msg.sender]);
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

    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) onlyOwner {
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }

    function sell(uint amount) returns (uint revenue) {
        require(balanceOf[msg.sender] >= amount );   // checks if the sender has enough to sell
        balanceOf[this] += amount;                  // adds the amount to owner's balance
        balanceOf[msg.sender] -= amount;            // subtracts the amount from seller's balance
        revenue = amount * sellPrice;
        if (!msg.sender.send(revenue)) {            // sends ether to the seller: it's important
            throw;                                  // to do this last to prevent recursion attacks
        } else {
            Transfer(msg.sender, this, amount);     // executes an event reflecting on the change
            return revenue;
        }
    }

    function freezeAccount(address account, bool freeze) onlyOwner {
        frozenAccounts[account] = freeze;
        FrozenFunds(account, freeze);
    }

}
