// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 用 solidity 实现罗马数字转数整数
contract RomanToInt {
    // 定义罗马字符到数值的映射表
    mapping(bytes1 => uint) private _romanMap;
    
    constructor() {
        // 在构造函数中初始化映射表
        _romanMap[0x49] = 1;   // I
        _romanMap[0x56] = 5;   // V
        _romanMap[0x58] = 10;  // X
        _romanMap[0x4C] = 50;  // L
        _romanMap[0x43] = 100; // C
        _romanMap[0x44] = 500; // D
        _romanMap[0x4D] = 1000; // M
    }

    function romanToInt(string memory s) public view  returns (uint) {
        require(bytes(s).length > 0, "Empty input");
        bytes memory strBytes = bytes(s);
        uint total = 0;
        uint i = 0;

        while (i < strBytes.length) {
            // 获取当前字符的数值
            uint current = _romanMap[strBytes[i]];
            
            // 检查下一个字符是否存在且构成减法规则
            if (i + 1 < strBytes.length) {
                uint next = _romanMap[strBytes[i + 1]];
                if (current < next) {
                    total += (next - current);
                    i += 2; // 跳过已处理的两个字符
                    continue;
                }
            }
            
            // 普通加法规则
            total += current;
            i += 1;
        }

        return total;
    }
}