pragma solidity ^0.4.21;

contract SimpleToken {

  address owner;

  mapping (address => uint256) balances;

  mapping (address => mapping(address => uint256)) allowed;

  string public constant name = "Sirius Education Token";

  string public constant symbol = "SET";

  uint256 public constant decimals = 18;

  uint256 public totalSupply = 0;

  function SimpleToken() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function mint(address _to, uint256 _value)  internal {
    balances[_to] += _value;
    totalSupply += _value;
    Transfer(this, _to, _value);
  }

  function transfer(address _to, uint256 _value) public returns(bool success) {
    if (balances[msg.sender] >= _value && balances[_to] + _value >= balances[_to]) {
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      Transfer(msg.sender, _to, _value);
      return true;
    }
    return false;
  }

  function balanceOf(address _owner) public view returns(uint256) {
    return balances[_owner];
  }

  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public constant returns(uint256 remaining) {
    return allowed[_owner][_spender];
  }


  event Transfer(address _from, address _to, uint256 _value);

  event Approval(address _owner, address _spender, uint256 _value);

  //ICO

  function getTokenAmount(uint256 _value) internal view returns(uint256) {
    return _value * 6667;
  }

  function () payable {
    uint256 weiAmount = msg.value;
    uint256 tokens = getTokenAmount(weiAmount);
    mint(msg.sender, tokens);
    owner.transfer(weiAmount);
  }

}