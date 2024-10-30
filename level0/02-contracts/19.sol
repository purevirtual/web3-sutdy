// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "hardhat/console.sol";
/*

### **Data Locations**

### **Data Locations - Storage, Memory and Calldata**

Variables are declared as either `storage`, `memory` or `calldata` to explicitly specify the location of the data.

- `storage` variable is a state variable (store on blockchain)
- `memory` variable is in memory and it exists while a function is being called
- `calldata` special data location that contains function arguments

```
storage:  固化放到链上的数据
memory: 内存运行，不上链
calldata: 一些固定的存储区域，主要放函数参数
看起来和c的结构有点像
*/

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructMap;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructMap[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructMap[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
        _map[1] = address(_map[1]);
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
        _arr[0] = 1314;
        return _arr;
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
       // _arr[0] = 996; calldata数据不可修改
       console.log("_arr %d",_arr[0]);
    }
}
