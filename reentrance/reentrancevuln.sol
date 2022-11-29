pragma solidity 0.6.6;

contract reentrance
{

    mapping(address=>uint)balances;

    function deposit() public payable
    {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public payable
    {
        require(amount<balances[msg.sender]);
        msg.sender.call.value(amount)("");
        balances[msg.sender] -= amount;        
    }

    function check_balance() view public returns( uint)
    {
        return balances[msg.sender];
    }

        
}
