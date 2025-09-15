// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
// 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数
contract Voting {
    // 候选人
    mapping(string name=>int count ) public candidatesMapping;
    // 投票人
    mapping(string =>bool ) public hasVoted;
    // 候选人名称列表（用于遍历）
    string[] public candidateNames;

    // 投票 入参 投票人 候选人
    function vote(string memory voterName,string memory candidateName)public  returns (bool){
        bool isNewCandidate = true;
        // 检查候选人是否已经存在
        for (uint i = 0; i < candidateNames.length; i++) {
           // if (candidateNames[i] == candidateName) {
            if (keccak256(abi.encodePacked(candidateNames[i])) == keccak256(abi.encodePacked(candidateName))) {

                isNewCandidate = false;
                break;
            }
        }
        // 如果是新候选人，添加到列表中
        if (isNewCandidate) {
            candidateNames.push(candidateName);
        }
        // 投票人已投票
        if (hasVoted[voterName]) {
            return false;
        } else {
            hasVoted[voterName] = true;
            candidatesMapping[candidateName] ++;
        }
    }

    // 返回某个候选人的得票数
    function getVotes(string memory name)public view returns (int){
        return candidatesMapping[name];
    }
    
    function resetVotes() public {
        // 重置所有候选人的得票数
        for (uint i = 0; i < candidateNames.length; i++) {
            candidatesMapping[candidateNames[i]] = 0;
        }
    }
}