pragma solidity ^0.4.21;


contract BiggerLess {

  uint256 number;

  function BiggerLess() {
    number = random(100);
  }
  
  
  function random(uint256 upper) internal returns (uint256 randomNumber) { // must be interna
    
    uint256 _seed = uint256(keccak256(block.blockhash(block.number)));
    return _seed % upper + 1;
  }

  function tryNumber(uint256 _number) view returns(string) {
    if (_number == number) {
      return("Right");
    }
    else if(number > _number) {
      return("Bigger");
    }
    else {
      return("Less");
    }
  }

  function setAnswer(uint256 _number) {
    if (_number == number) {
      msg.sender.transfer(this.balance);
    }
  }

  function() payable {

  }
}
