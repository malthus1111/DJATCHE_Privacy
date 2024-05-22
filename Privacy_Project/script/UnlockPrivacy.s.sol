// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Privacy.sol";

contract UnlockPrivacy is Script {
    function run() external {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");
        
        Privacy privacy = Privacy(instanceAddress);

        bytes32 data2 = vm.load(instanceAddress, bytes32(uint256(5)));
        
        bytes16 key = bytes16(data2);

        vm.startBroadcast();
        privacy.unlock(key);
        vm.stopBroadcast();

        console.log("Contract unlocked!");
    }
}
