// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract JETPresale {
    address public owner;
    uint256 public totalSupply = 800_000_000 * 10**18; 
    uint256 public soldTokens = 0;
    uint256 public constant RATE = 100000; 
    uint256[] public stages = [200000000 * 10**18, 200000000 * 10**18, 200000000 * 10**18, 200000000 * 10**18]; 
    
    mapping(address => uint256) public balances;
    
    constructor() {
        owner = msg.sender;
    }
    
    function buy(uint256 amount) public payable {
        uint256 tokens = amount * RATE;
        require(soldTokens + tokens <= totalSupply, "Exceeds supply");
        balances[msg.sender] += tokens;
        soldTokens += tokens;
    }
    
    function withdraw() public {
        require(msg.sender == owner);
        payable(owner).transfer(address(this).balance);
    }
}