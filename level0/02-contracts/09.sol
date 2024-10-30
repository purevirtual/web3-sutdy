// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*

### **Gas**

### **How much ****ether**** do you need to pay for a transaction?**

You pay `gas spent * gas price` amount of `ether`, where

- `gas` is a unit of computation
- `gas spent` is the total amount of `gas` used in a transaction
- `gas price` is how much `ether` you are willing to pay per `gas`

Transactions with higher gas price have higher priority to be included in a block.

Unspent gas will be refunded.

### **Gas Limit**

There are 2 upper bounds to the amount of gas you can spend

- `gas limit` (max amount of gas you're willing to use for your transaction, set by you)
- `block gas limit` (max amount of gas allowed in a block, set by the network)


gas是计算单位，gas spent - 花费多少gas 意思是一次交易消耗的总gas数
gas price - gas价格，是将要支付的 eth/gas 的数量

gas price高的交易 将会更高优先级执行（类似现实中的竞价排名
没有消耗的多余gas会被退款（多退 有无少补？

gas上限
有2个限制
1是 gas limit -- 交易最高消耗的gas总数，是你发送的
2是block gas limit - 区块消耗的gas限制，单个区块消耗的最大gas数，这个是网络决定的
换言之第2个是区块链系统写死的，第1个是执行者设定的
```
*/
contract Gas {
    uint256 public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            i += 1;
        }
    }
}
