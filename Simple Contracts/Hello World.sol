pragma solidity ^0.4.21;


contract BiggerLess {

  uint256 number;
  address public Dima = 0x6B35d857486800768b5878eE2F827D7046a7dd6E;

  function setNumber(uint256 _number) {
    require(msg.sender == Dima);
    number = _number;
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
