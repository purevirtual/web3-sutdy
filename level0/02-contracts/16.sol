// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
### **Enum**

Solidity supports enumerables and they are useful to model choice and keep track of state.

Enums can be declared outside of a contract.
枚举可以定义在contract的外面，how? 单独开一个contract? 看起来类似c里的header
```
*/
contract Enum {
    // Enum representing shipping status
    // 0,1,2,3,4
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    // delete类似 其他语言中的 **=null
    function reset() public {
        delete status;
    }
}
