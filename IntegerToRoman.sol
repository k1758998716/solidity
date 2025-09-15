// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {
    struct RomanMapping {
        uint value;
        string symbol;
    }
    
    // 状态变量存储罗马数字映射表
    RomanMapping[] private _romanNumerals;
    // 用 solidity 实现整数转罗马数字
    constructor() {
        // 在构造函数中初始化数组
        _romanNumerals.push(RomanMapping(1000, "M"));
        _romanNumerals.push(RomanMapping(900, "CM"));
        _romanNumerals.push(RomanMapping(500, "D"));
        _romanNumerals.push(RomanMapping(400, "CD"));
        _romanNumerals.push(RomanMapping(100, "C"));
        _romanNumerals.push(RomanMapping(90, "XC"));
        _romanNumerals.push(RomanMapping(50, "L"));
        _romanNumerals.push(RomanMapping(40, "XL"));
        _romanNumerals.push(RomanMapping(10, "X"));
        _romanNumerals.push(RomanMapping(9, "IX"));
        _romanNumerals.push(RomanMapping(5, "V"));
        _romanNumerals.push(RomanMapping(4, "IV"));
        _romanNumerals.push(RomanMapping(1, "I"));
    }
    
    function intToRoman(uint num) public view returns (string memory) {
        require(num >= 1 && num <= 3999, "Number out of range");
        
        bytes memory result = new bytes(15); // 最大长度15（MMMCMXCIX）
        uint index = 0;
        
        for (uint i = 0; i < _romanNumerals.length; i++) {
            while (num >= _romanNumerals[i].value) {
                bytes memory symbolBytes = bytes(_romanNumerals[i].symbol);
                for (uint j = 0; j < symbolBytes.length; j++) {
                    result[index++] = symbolBytes[j];
                }
                num -= _romanNumerals[i].value;
            }
        }
        
        return string(result);
    }
    
}