// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
//  反转字符串 (Reverse String)
// 题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
contract ReverseString{

    function reverString(string memory s)public pure returns(string memory){
        bytes memory bs = bytes(s);
        uint len = bs.length;
        bytes memory reversed = new bytes(len);

        for (uint i = 0; i < len; i++) {
            reversed[i] = bs[len - 1 - i];
        }
        return string(reversed);
    }
}