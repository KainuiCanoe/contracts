pragma solidity ^0.4.11;

contract ERC20 {
    function totalSupply() constant returns (uint totalSupply);
    function balanceOf(address owner) constant returns (uint balance);
    function transfer(address to, uint value) returns (bool success);
    function transferFrom(address from, address to, uint value) returns (bool success);
    function approve(address spender, uint value) returns (bool success);
    function allowance(address owner, address spender) constant returns (uint remaining);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
