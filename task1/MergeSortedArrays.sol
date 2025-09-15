// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 题目描述：将两个有序数组合并为一个有序数组。
contract MergeSortedArrays {
    function merge(uint[] memory nums1, uint m, uint[] memory nums2, uint n) public {
        // 从后往前合并的指针初始化
        uint i = m - 1;  // nums1有效元素末尾
        uint j = n - 1;  // nums2末尾
        uint k = m + n - 1;  // 合并后末尾
        
        // 逆向合并过程
        while (i >= 0 && j >= 0) {
            if (nums1[i] > nums2[j]) {
                nums1[k] = nums1[i];
                i--;
            } else {
                nums1[k] = nums2[j];
                j--;
            }
            k--;
        }
        
        // 处理剩余元素（nums2可能还有剩余）
        while (j >= 0) {
            nums1[k] = nums2[j];
            j--;
            k--;
        }
    }
}