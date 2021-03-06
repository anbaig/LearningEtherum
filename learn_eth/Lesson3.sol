pragma solidity ^0.5.1;

contract Lesson3 {
    uint256 public peopleCount = 0;
    /*
    this a map structure
    */
    mapping(uint256 => Person) public people;

    /*
    address is a primative that refers to a address
    on the blockchain
    */
    address owner;

    /*
    this is how you can construct your own visibility modifiers. 
    If conditions for the modifiers are met, you may call the function
    that they are attached to
    */
    modifier onlyOwner() {
        require(msg.sender == owner);
        // this is just required by modifiers :)
        _;
    }

    /*
    This is meant to express that only after this date will this 
    contract accept interactions, before that it will thrown an error
    */
    uint256 openingTime = 1614989421;

    modifier onlyWhileOpen() {
        ///block.timestamp is how you get the current blocks timestamp
        require(block.timestamp >= openingTime);
        _;
    }

    /*
    This works just like you'd imagine
    */
    struct Person {
        uint256 _id;
        string _firstName;
        string _lastName;
    }

    /* When this contract is first created, whoever created
    it is set to the owner, the constructor is never called again
    after deployment, so unless set somewhere else, the owner will remain
    the same forever
    */
    constructor() public {
        owner = msg.sender;
    }

    // this function can only be called by the owner
    function addPerson(string memory _firstName, string memory _lastName)
        public
        onlyOwner
        onlyWhileOpen
    {
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        incrementCount();
    }

    /*
    This is a private function
    */

    function incrementCount() internal {
        peopleCount += 1;
    }
}
