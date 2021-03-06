pragma solidity ^0.5.1;

contract Lesson4 {
    mapping(address => uint256) public balances;
    /* 
    Payable just means that in this contact this address will 
    have etherum transfered to it
    */
    address payable wallet;

    /* This is an event that can be sent
    out to the whole blockchain, those who are 
    listening for these events will be able to 
    see who used this contract to buy a token */
    event Purchase(
        /*
        Why indexed? Indexed is a keyword attached to parameter
        in the event that allow someone to filter all events that
        this contract may have emitted via an indexed paramter rather
        than having to grab all events. Without the indexed keyword, 
        there is no way to filter on that parameter amongst all events 
        the contract has emitted and you'll be forced to look at all events
        */
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    /* External functions may only be called by an
    External account, the smart contract cannot call this function
    inside of it anywhere
    */
    function() external payable {
        buyToken();
    }

    function buyToken() public payable {
        // buy a token
        balances[msg.sender] += 1;
        // send ether to the wallet
        wallet.transfer(msg.value);
        // sending an event out
        emit Purchase(msg.sender, 1);
    }
}
