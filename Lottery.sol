contract Lottery {

  address public admin;
  uint256 public minValue = 0.1 * 1 ether; //1e17
  uint256 public totalBets;

  mapping(uint256 => address) users;

  // address[] users;
  mapping(address => uint256) returnValues;
  uint256 countUsers = 0;



  function Lottery(address _admin) {
    admin = _admin;
  }

  function takeBet() public payable {
    require(msg.value >= minValue);

    if (msg.value > minValue) {
      returnValues[msg.sender] = msg.value - minValue;
    }

    users[countUsers] = msg.sender;
    countUsers += 1;
    totalBets += msg.value;
  }

  function refund() public {
    uint256 value = returnValues[msg.sender];
    msg.sender.transfer(value);
  }

  function finishLottery() public {
    require(msg.sender == admin);
    uint256 winningNumber = uint256(block.blockhash(block.number - 1)) % countUsers;
    countUsers = 0;
    totalBets = 0;

    selfdestruct(users[winningNumber]);
  }

}

contract LotteryFactory {

  mapping (uint256 => address) public Lotteries;
  uint256 public lotteriesCounter;

  function createLottery() {
    address newLottery = new Lottery(msg.sender);
    lotteriesCounter += 1;
    Lotteries[lotteriesCounter] = newLottery;
  }



}