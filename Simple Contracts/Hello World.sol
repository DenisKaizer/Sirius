
pragma solidity ^0.4.18;

contract HelloWorld {

  string public wellcomeString;
  //address owner;
  /*
  function HelloWorld() {
    owner == msg.sender;
  }
  */
  function setData(string newData) public {
    //require(msg.sender == owner);
    wellcomeString = newData;
  }

}


contract SetGet {

  mapping (uint256 => string) public data;
  //mapping (uint256 => string) public data;


  function setData(uint256 key ,string newData) public {
    data[key] = newData;
  }

  /*
  function setData(bytes32 key ,string newData) public {
    data[key] = newData;
  }
  */
}