pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps";

  address public owner;

  struct VoteProposal {
    string name;
    bool complete;
  }

  VoteProposal[] private proposals;

  

  constructor() {
    address owner = msg.sender;
  }

  // use block.timestamp or block.number to track time in our contract

  receive() external payable {
    
  }

  function vote(string memory _name) public {
    proposals.push(VoteProposal(_name, true));
  }
 
  uint8 public count = 1;

  function dec() public {
    count = count - 1;
  }

  function setPurpose(string memory newPurpose) public {
    if (owner != 0x0000000000000000000000000000000000000000) {
      require( msg.sender == owner );
    }
    purpose = newPurpose;
    console.log(msg.sender,"set purpose to",purpose);
    emit SetPurpose(msg.sender, purpose);
  }

}
