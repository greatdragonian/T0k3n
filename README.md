# T0k3n Smart Contract Documentation

## Overview

The T0k3n smart contract is a basic ERC-20 token written in Solidity. It includes functionalities for transferring tokens, checking balances, approving token transfers, and checking allowances. Below is the documentation for deploying and interacting with the contract.

## Deployment

1. Ensure that you have the required version of Solidity (>=0.8.0 <0.9.0) installed.
2. Deploy the `T0k3n` contract to the Redbelly Network.

## Contract Details

- **Name**: T0k3n
- **Symbol**: T0k3n
- **Decimals**: 18
- **Total Supply**: 1,000,000 T0k3ns

## Functions

### `totalSupply()`

Returns the total supply of T0k3n.

### `balanceOf(address tokenOwner)`

Returns the balance of T0k3n held by the specified address.

### `transfer(address receiver, uint numTokens)`

Transfers a specified number of T0k3n from the sender's account to the specified receiver.

### `approve(address delegate, uint numTokens)`

Allows the specified delegate to spend a specified number of T0k3n on behalf of the sender.

### `allowance(address owner, address delegate)`

Returns the remaining allowance of T0k3n that the delegate can spend on behalf of the owner.

### `transferFrom(address owner, address buyer, uint numTokens)`

Transfers a specified number of T0k3n from the owner's account to the buyer's account, given that the sender has been approved to spend on behalf of the owner.

## Events

### `Transfer(address indexed from, address indexed to, uint tokens)`

Emitted when tokens are transferred from one address to another.

### `Approval(address indexed tokenOwner, address indexed spender, uint tokens)`

Emitted when the allowance of a spender is approved by the token owner.

## Usage

1. Deploy the contract.
2. Interact with the contract using the provided functions.

```solidity
// Example usage in Solidity
T0k3n token = new T0k3n();
address receiver = 0x123...; // Replace with the desired address

// Transfer tokens
token.transfer(receiver, 100);

// Approve delegate to spend tokens
token.approve(delegateAddress, 50);

// Check allowance
uint allowance = token.allowance(ownerAddress, delegateAddress);

// TransferFrom using the approved allowance
token.transferFrom(ownerAddress, buyerAddress, 30);
