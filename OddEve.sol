// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract OddEve {

    // Variables:
    uint public runs = 0;           // tracks the score of computer
    uint public humanInput = 0;     // the input given by user
    uint public computerInput = 0;  // random input calculated by computer
    bool public canPlay = true;     // boolean to decide whether we have to reset after loss of computer

    // string public runString;
    // string public res;
    
    // Functions:
    
    // This function resets the RUNS value sets boolean to true allowing user to play the game.
    function reset() public returns(uint) {
        canPlay = true;
        runs = 0;
        return(runs);
    }

    // This function calculates a random number using keccak hash through the arguments: block's difficulty.
    // block's timestamp and the input given by the user.
    function random(uint _humanInput) private view returns(uint) {
        return(uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp, _humanInput))));
    }

    // This function takes the input from user and also generates computer input using the random function.
    // Further this function checks if the human input is equal to computer input and proceed conditionally.
    function play(uint _humanInput) public returns(string memory, uint) {
        require(_humanInput > 0, "Invalid Input (input not in range)" );    // input should be greater than 0
        require(_humanInput < 7, "Invalid Input (input not in range)");     // input should be less than 7
        require(canPlay, "You have to reset/restart the game!");            
        
        humanInput = _humanInput;
        computerInput = (random(humanInput) % 6) + 1;
        
        if (_humanInput == computerInput) {
            canPlay = false;
            // runString = Strings.toString(runs);
            // res = string.concat("RUN", runString);
            return ("OUT", runs);
        }
        else {
            assert(runs + computerInput >= runs);   // to check that RUNS do not overflow and produce error due to wrapping during a long game.
            runs += computerInput;
            return ("RUNS", computerInput);
        }
    }
}
