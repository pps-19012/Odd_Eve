// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "remix_tests.sol";
import "./OddEve.sol";

contract TestOddEve {
    OddEve test;
    uint public compval;
    uint public currRuns;

    // beforeEach works before running each test
    function beforeEach() public {
        test = new OddEve();
        test.reset();
    }

    /// Test if initial value is set correctly
    function initialRunInNewGame() public returns (bool) {
        return Assert.equal(test.runs(), 0, "initial value is not correct");
    }

    /// Tests:

    function test1() public returns (bool) {
        test.play(9);
        compval = test.computerInput();
        currRuns = test.runs();
        if (compval == 9) {
            return Assert.equal(test.runs(), 0, "not working properly");
        }
        else {
            return Assert.equal(test.runs(), (currRuns+compval), "not working properly");
        }
    }

    function test2() public returns (bool) {
        currRuns = test.runs();
        test.play(0);
        return Assert.equal(test.runs(), currRuns, "not working properly");
    }

    function test3() public returns (bool) {
        test.play(2);
        compval = test.computerInput();
        currRuns = test.runs();
        if (compval == 2) {
            return Assert.equal(test.runs(), 0, "not working properly");
        }
        else {
            return Assert.equal(test.runs(), (currRuns+compval), "not working properly");
        }
    }

    function test4() public returns (bool) {
        currRuns = test.runs();
        test.play(20);
        return Assert.equal(test.runs(), currRuns, "not working properly");
    }
}
