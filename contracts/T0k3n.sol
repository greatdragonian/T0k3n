// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @title A simple ERC-20 token contract named T0k3n.
/// @notice This contract provides basic functionalities for a standard ERC-20 token.
library SafeMath { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract T0k3n {

    using SafeMath for uint256;

    // Token metadata
    string public constant name = "T0k3n";
    string public constant symbol = "T0k3n";
    uint8 public constant decimals = 18;  
    uint256 totalSupply_ = 1000000 * (10**18);

    // Events
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    // Balances and allowances
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    /// @dev Contract constructor initializes the total supply and assigns it to the contract creator.
    constructor() {  
        balances[msg.sender] = totalSupply_;
    }  

    /// @dev Gets the total supply of T0k3n.
    /// @return The total supply of T0k3n.
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
    
    /// @dev Gets the balance of the specified address.
    /// @param tokenOwner The address to query the balance of.
    /// @return The balance of the specified address.
    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

    /// @dev Transfers tokens to a specified address.
    /// @param receiver The address to which tokens are transferred.
    /// @param numTokens The number of tokens to transfer.
    /// @return A boolean indicating whether the transfer was successful.
    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    /// @dev Approves the specified address to spend on behalf of the sender.
    /// @param delegate The address to be approved.
    /// @param numTokens The number of tokens to approve for spending.
    /// @return A boolean indicating whether the approval was successful.
    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    /// @dev Gets the remaining allowance that the specified address can spend on behalf of the owner.
    /// @param owner The owner's address.
    /// @param delegate The delegate's address.
    /// @return The remaining allowance of the delegate.
    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    /// @dev Transfers tokens from one address to another, given the necessary approvals.
    /// @param owner The owner's address.
    /// @param buyer The buyer's address.
    /// @param numTokens The number of tokens to transfer.
    /// @return A boolean indicating whether the transfer was successful.
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);    
        require(numTokens <= allowed[owner][msg.sender]);
    
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
