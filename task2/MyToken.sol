// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MyToken {

    // 合约地址：0xdae3F82e9033547D3F2a40244306e089ab650036
    // 状态变量
    string public constant name = "MyToken";
    string public constant symbol = "MTK";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;
    // 余额
    mapping(address => uint256) private _balances;
    // 授权额度
    mapping(address => mapping(address => uint256)) private _allowances;
    // 合约持有者
    address public owner;

    // 事件定义
    // 转账记录
    event Transfer(address indexed from, address indexed to, uint256 value);
    // 授权记录
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // 构造函数 初始化合约者、合约者代币数量、代币总数
    constructor(uint256 initialSupply) {
        owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }

    // 前置校验
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // 余额
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    // 转账
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    // 授权
    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
    // 代扣转账
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender] - amount);
        return true;
    }

    // 授权函数
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _mint(address account, uint256 amount) internal {
        totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "Transfer from zero address");
        require(recipient != address(0), "Transfer to zero address");
        require(_balances[sender] >= amount, "Insufficient balance");
        
        _balances[sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "Approve from zero address");
        require(spender != address(0), "Approve to zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}