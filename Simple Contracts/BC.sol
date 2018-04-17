
contract Ownable {

  address owner;

  function Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner()  {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    owner = newOwner;
  }

}

contract BusinessCard is Ownable {

  mapping (bytes32 => string) public data;

  function setData(bytes32 key, string value) public onlyOwner {
    data[key] = value;
  }

}