# T0k3n Smart Contract Documentation

## Overview

T0k3n is a basic ERC-20 token written in Solidity. As it is expected, it includes functionalities for transferring tokens, checking balances, approving token transfers, and checking allowances. Below is the documentation for deploying the
contract in the [Redbelly](https://www.redbelly.network) DevNet and interacting with it.

## Deployment

The contract is simple enough to be deployed using the [Remix Online IDE](https://remix.ethereum.org), using the following steps:

1. Get access to the Redbelly DevNet using the instructions provided in the [Vine Portal](https://access.devnet.redbelly.network)
2. Use the Redbelly Devnet Faucet to send some coins to your registered wallet. The faucet can be found in the [Redbelly Discord](https://discord.gg/redbelly)
3. Go to the [Remix Online IDE](https://remix.ethereum.org).
4. Copy the `t0k3n.sol` file in the `contracts` directory.
5. Before compiling the contract, make sure you use the Solidity compiler version 0.8.23. With the __Paris EVM version__ (using the default EVM version will not work for Redbelly).
6. Compile the contract
7. Connect your registered Metamask wallet (steps 1 and 2) to Remix.
8. Deploy the contract!

## Contract Details

- **Name**: T0k3n
- **Symbol**: T0k3n
- **Decimals**: 18
- **Total Supply**: 1,000,000 T0k3ns

## Functions

### `totalSupply()`

Public view that returns the total supply of T0k3n.

### `balanceOf(address tokenOwner)`

Public view that returns the balance of T0k3n held by the specified address.

### `transfer(address receiver, uint numTokens)`

Function that transfers a specified number of T0k3n from the transaction sender's account to the specified receiver.

### `approve(address delegate, uint numTokens)`

Public function that allows the specified delegate to spend a specified number of T0k3n on behalf of the transaction sender.

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
