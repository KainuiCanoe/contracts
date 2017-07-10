pragma solidity ^0.4.11;


contract owned {
    address owner;

    // Functions with this modifier can only be executed by the owner
    modifier onlyOwner() {
        require (msg.sender != owner);
        _;
    }

    // This is the constructor which registers the creator.
    function owned() {
        owner = msg.sender;
    }

}
