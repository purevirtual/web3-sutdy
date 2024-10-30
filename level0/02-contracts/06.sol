// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
### **Immutable**

Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.

```
总体来说immutable就是不可变的变量，和const相比就是可以在构造里赋值一次后续不可再改
*/
contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
