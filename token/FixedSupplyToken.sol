pragma solidity ^0.4.0;


contract FixedSupplyToken is ERC20BasicToken {

    string public constant name = "Fixed Supply Token";
    string public constant symbol = "FIXED";

    // Constructor
    function FixedSupplyToken(uint256 initialSupply) {
        totalSupply = initialSupply;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }

    // Allow _spender to withdraw from your account, multiple times, up to the _value amount.
    // If this function is called again it overwrites the current allowance with _value.
    function approve(address _spender, uint256 _amount) returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }

}
