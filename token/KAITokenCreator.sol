pragma solidity ^0.4.0;


contract KAITokenCreator {

    enum Actor {ContentProvider, Investor, Founder}

    function createToken(Actor actor) returns (KAIToken tokenAddress) {
        // Create a new Token contract and return its address.
        // From the JavaScript side, the return type is simply
        // "address", as this is the closest type available in
        // the ABI.
        if(action = Founder) return new KAIFounderToken();
        if(action = Investor) return new KAIInvestorToken();
        if(action = ContentProvider) return new KAIContentToken();
    }

    function isTokenTransferOK(address currentOwner, address newOwner) returns (bool ok) {
        // Check some arbitrary condition.
        address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
}2
