// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 题目描述：在一个有序数组中查找目标值。
contract BinarySearch {
   
    function binarySearch(uint[] memory arr, uint target) public view returns (int256) {
        require(arr.length > 0, "Empty array");
        
        int256 left = 0;
        int256 right = int256(arr.length) - 1;
        
        while (left <= right) {
            // 防止整数溢出的中间值计算
            int256 mid = left + (right - left) / 2;
            
            if (uint(mid) >= arr.length) {
                return -1; // 中间索引超出数组范围
            }
            
            uint midVal = arr[uint(mid)];
            
            if (midVal == target) {
                return mid;
            } else if (midVal < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        
        return -1;
    }
}