# Odd_Eve
This smart contract was deployed on Rinkeby Testnet Network.

## About the files present in this repo
 - [OddEve.sol](https://github.com/pps-19012/Odd_Eve/blob/main/OddEve.sol) is the primary file containing the Solidity code and it was deployed on the Rinkeby Testnet Network.
 - [oddeve.test.js](https://github.com/pps-19012/Odd_Eve/blob/main/oddeve.test.js) is the primary file used for testing the smart contract. It uses [Chai](https://www.chaijs.com/) for testing various functions and variables.
 - [TestOddEve.sol](https://github.com/pps-19012/Odd_Eve/blob/main/TestOddEve.sol) is an additional file. It imports OddEve.sol and acts as a test file for OddEve.sol. It makes interaction easy using Remix IDE.
 - [scenario.json](https://github.com/pps-19012/Odd_Eve/blob/main/scenario.json) is an additional file. It contains the data of some of the intial transactions that were performed on the Remix IDE.

### Address of Deployed Smart Contract:
0x50eAD59e664DbF9252aF0487Fc8fECA92403d1f7 - [View on Rinkeby Etherscan](https://rinkeby.etherscan.io/address/0x50eAD59e664DbF9252aF0487Fc8fECA92403d1f7)

![transactions](https://github.com/pps-19012/Odd_Eve/blob/main/transactions.png)

## Transactions
Deployment Transaction: [View on Etherscan](https://rinkeby.etherscan.io/tx/0x90ec0851c29e8a419cb0052e0bb82b793b1ad32a9a591bfe5da127521d6b63c4) 

These are the list of some initial transactions:
- [User Input = 1](https://rinkeby.etherscan.io/tx/0x037e240baf769c3777866b5bea0a7bac4969548b036be10a2275f35b956085b8)
Here, the user input is equal to 1 which is between desired range. Hence, the transaction is fulfilled.

- [User Input = 0](https://rinkeby.etherscan.io/tx/0x28e02a0c12e508b18b25e92422c1b12f8cbdb6a26283f1523a0095a55f0e1047)
Here, the user input is equal to 0 which is not between desired range. Hence, the transaction will fail with the custom error - "Invalid Input (input not in range)"

- [User Input = 10](https://rinkeby.etherscan.io/tx/0xb0d9c7e471c5104cf39eed1a0324c861a934a012d6816cdefa2a00eb269e5640)
Here, the user input is equal to 10 which is not between desirec range. Hence, the transaction will fail with custom error - "Invalid Input (input not in range)"

## Deployment on Remix IDE
- Functions
  - Play - User will provide input, i.e., the human input to the program.
  - Reset - Once the computer loses, user must reset the game to start again.
 
![remix ui](https://github.com/pps-19012/Odd_Eve/blob/main/remixui.png)


