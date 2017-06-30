pragma solidity ^0.4.0;

/**
    Basic implementation of an ERC20Token.
**/
contract ERC20BasicToken is ERC20Token {

    string public constant name = "ERC20 Basic Token";
    string public constant symbol = "ERC20";
    uint8 public constant decimals = 18;  // 18 is the most common number of decimal places
    // Owner of this contract
    address public owner;

    function ERC20BasicToken(){
        owner = msg.sender;

    }

    // Balances for each account
    mapping(address => uint256) balances;

    // Owner of account approves the transfer of an amount to another account
    mapping(address => mapping (address => uint256)) allowed;

    function totalSupply() constant returns (uint totalSupply) {

    }

    // What is the balance of a particular account?
    function balanceOf(address owner) constant returns (uint256 balance) {
        return balances[owner];
    }

    // Transfer the balance from owner's account to another account
    function transfer(address to, uint256 amount) returns (bool success) {
        if (balances[msg.sender] >= amount
            && amount > 0
            && balances[to] + amount > balances[to]) {
            balances[msg.sender] -= amount;
            balances[to] += amount;
            return true;
        } else {
            return false;
        }
    }

    // Send value amount of tokens from address from to address to
    // The transferFrom method is used for a withdraw workflow, allowing contracts to send
    // tokens on your behalf, for example to "deposit" to a contract address and/or to charge
    // fees in sub-currencies; the command should fail unless the from account has
    // deliberately authorized the sender of the message via some mechanism; we propose
    // these standardized APIs for approval:
    function transferFrom(address from, address to, uint256 amount) returns (bool success) {
        if (balances[from] >= amount
        && allowed[from][msg.sender] >= amount
        && amount > 0
        && balances[to] + amount > balances[to]) {
            balances[from] -= amount;
            allowed[from][msg.sender] -= amount;
            balances[to] += amount;
            return true;
        } else {
            return false;
        }
    }

    // Allow spender to withdraw from your account, multiple times, up to the value amount.
    // If this function is called again it overwrites the current allowance with value.
    function approve(address spender, uint256 amount) returns (bool success) {
        allowed[msg.sender][spender] = amount;
        return true;
    }

    function allowance(address owner, address spender) constant returns (uint remaining) {
        return allowed[owner][spender];
    }

}
