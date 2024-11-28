// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*
这一个实战主要是加深大家对 3 个取钱方法的使用。

任何人都可以发送金额到合约
只有 owner 可以取款
3 种取钱方式

*/

contract EtherWallet {
    address payable public immutable owner;
    event Log(string funName, address from, uint256 value, bytes data);

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    // 1 transfer
    function withdraw1() external {
        require(msg.sender == owner, "Not owner");
        // owner.transfer 相比 msg.sender 更消耗Gas
        // owner.transfer(address(this).balance);
        payable(msg.sender).transfer(100);
    }

    // 2 send 然后结尾的地方验证一下是否send成功，如果失败会有相关的报错 -- Send Failed
    function withdraw2() external {
        require(msg.sender == owner, "Not owner");
        bool success = payable(msg.sender).send(200);
        require(success, "Send Failed");
    }

    // 3 call  ? 这个意思是说，可以使用call来调用 balance拥有者的余额?
    function withdraw3() external {
        require(msg.sender == owner, "Not owner");
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Call Failed");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}