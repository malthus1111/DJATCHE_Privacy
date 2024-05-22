// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console} from "forge-std/Script.sol";
import "../src/Privacy.sol";

contract PrivacySolution is Script {
    
    function run() public {

        bytes32[3] memory data = [
            bytes32("one"),
            bytes32("two"),
            bytes32("three")
        ];

        Privacy privacy = new Privacy(data);

        console.log("Locked:", privacy.locked());

        bytes16 key = bytes16(data[2]);

        privacy.unlock(key);

        console.log("Locked:", privacy.locked());
    }
    
}