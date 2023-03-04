pragma solidity ^0.8.0;

contract PaymentContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function receivePayment() external payable {
        // do something with the payment, e.g. update balance
    }

    function withdrawBalance(address payable recipient) external {
        require(msg.sender == owner, "Only the contract owner can withdraw the balance");
        uint256 balance = address(this).balance;
        require(balance > 0, "The contract balance is empty");

        recipient.transfer(balance);
    }
}
