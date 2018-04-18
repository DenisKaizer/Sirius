pragma solidity ^0.4.21;


contract BiggerLess {

  uint256 number;
  address Dima;

  function setNumber(uint256 _number) {
    require(msg.sender == Dima);
    number = _number;
  }


  function try(uint256 _number) view returns(string) {
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

  function() payable;
}
