pragma solidity ^0.5.1;

contract Lesson1 {
    /*
    Since these variables are public they do not 
    require a getter for external parties to access the data
    and can be accessed directly
    */
    string public stringValue = "myValue";
    bool public myBool = true;
    int256 public myInt = -11;
    uint256 public myUint = 1;

    /* 
      How to create a enum and set the State
    */

    enum State {Waiting, Ready, Active}

    State public state = State.Waiting;

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }
}
