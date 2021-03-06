pragma solidity ^0.5.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        /*
        THIS IS WRONG, since this code will be called by another 
        contract, by using msg.sender here, it will increase the balance
        of the CONTRACT address and not the individual who actually called
        the Lesson5 contract to buyToken() for their own account
        
        balances[msg.sender]++;
        
        */

        //tx.origin is the address of who called the smart contract intitally
        balances[tx.origin]++;
    }
}

contract Lesson5 {
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    function() external payable {
        buyToken();
    }

    function buyToken() public payable {
        /*
        This is the long version of the code for reference
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        */
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);
    }
}
