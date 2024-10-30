// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
### **Structs**

You can define your own type by creating a `struct`.

They are useful for grouping together related data.

Structs can be declared outside of a contract and imported in another contract.

就是这里的class，可以单独定义一个contract被其他引用
```
*/
contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todoArr;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todoArr.push(Todo(_text, false));

        // key value mapping
        todoArr.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todoArr.push(todo);
    }

    // Solidity automatically created a getter for 'todoArr' so
    // you don't actually need this function.
    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todoArr[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todoArr[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todoArr[_index];
        todo.completed = !todo.completed;
    }
}
