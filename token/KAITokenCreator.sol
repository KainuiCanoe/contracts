pragma solidity ^0.4.11;


contract KAITokenCreator {

    enum Actor {ContentProvider, Investor, Founder}

    function createToken(Actor actor) returns (KAIToken tokenAddress) {
        // Create a new Token contract and return its address.
        // From the JavaScript side, the return type is simply
        // "address", as this is the closest type available in
        // the ABI.
        if(actor == Founder) return new KAIFounderToken();
        if(actor == Investor) return new KAIInvestorToken();
        if(actor == ContentProvider) return new KAIContentToken();
        throw;
    }

    function isTokenTransferOK(address currentOwner, address newOwner) returns (bool ok) {
        // Check some arbitrary condition.
        address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
}
