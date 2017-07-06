pragma solidity ^0.4.0;

import './KAIToken.sol';

contract KAIContentToken is KAIToken {
    string public constant name = "KAI-C Token";
    string public constant symbol = "KAI-C";
    uint256 public constant totalSupply = 5333333; // 5 Million, 3 Hundred Thirty Three Thousand, 3 Hundred Thirty Three (60%)
    uint256 public circulating = 0;

    function KAIContentToken() KAIToken() {

    }
}
