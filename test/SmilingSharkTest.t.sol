// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Test, console} from "forge-std/Test.sol";
import {SmilingShark} from "../src/SmilingShark.sol";

contract SmilingSharkTest is Test {
    SmilingShark smilingShark;
    function setUp() external {
        smilingShark = new SmilingShark();
    }
    function testMAXSUPPLYisFive() public {
        console.log(smilingShark.MAX_SUPPLY());
        assertEq(smilingShark.MAX_SUPPLY(), 5);
    }
}