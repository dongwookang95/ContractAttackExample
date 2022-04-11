// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Bank{
    //2. Or we can use modifier
    bool internal locked;
    modifier noReentrant(){
        require(!locked, "Not allowed action");
        locked = true;
        _;
        locked = false;
        // executes after function has finished
    }


    mapping(address => uint) public balances;

    function deposit() public payable{
        balances[msg.sender] +=msg.value;
    }

    

    function withdraw() public noReentrant{
        uint bal = balances[msg.sender];
        require(bal>0);

        //1. Update balance first before we proceed to call external function
        //By following line, we can restrice one account to withdraw once
        //balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value:bal}("");

        require(sent,"Failed to send Ether");
    }
}