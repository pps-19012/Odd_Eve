# Odd_Eve
This smart contract was deployed on Rinkeby Testnet Network.

### Address of Deployed Smart Contract:
0x50eAD59e664DbF9252aF0487Fc8fECA92403d1f7

## Transactions
Deployment Transaction: [View on Etherscan](https://rinkeby.etherscan.io/tx/0x90ec0851c29e8a419cb0052e0bb82b793b1ad32a9a591bfe5da127521d6b63c4) 

These are the list of some initial transactions:
- [User Input = 1](https://rinkeby.etherscan.io/tx/0x037e240baf769c3777866b5bea0a7bac4969548b036be10a2275f35b956085b8)
Here, the user input is equal to 1 which is between desired range. Hence, the transaction is fulfilled.

- [User Input = 0](https://rinkeby.etherscan.io/tx/0x28e02a0c12e508b18b25e92422c1b12f8cbdb6a26283f1523a0095a55f0e1047)
Here, the user input is equal to 0 which is not between desired range. Hence, the transaction will fail with the custom error - "Invalid Input (input not in range)"

- [User Input = 10](https://rinkeby.etherscan.io/tx/0xb0d9c7e471c5104cf39eed1a0324c861a934a012d6816cdefa2a00eb269e5640)
Here, the user input is equal to 10 which is not between desirec range. Hence, the transaction will fail with custom error - "Invalid Input (input not in range)"
