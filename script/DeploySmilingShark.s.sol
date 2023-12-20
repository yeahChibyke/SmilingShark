// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Script} from "forge-std/Script.sol";
import {SmilingShark} from "../src/SmilingShark.sol";

contract DeploySmilingShark is Script {
    function run() external returns(SmilingShark) {
        vm.startBroadcast();
        SmilingShark smilingShark = new SmilingShark();
        vm.stopBroadcast();
        return smilingShark;
    }
}