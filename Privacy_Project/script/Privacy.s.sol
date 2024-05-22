// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Script, console} from "forge-std/Script.sol";
import "../src/Privacy.sol";

contract PrivacySolution is Script {
    
    function run() public {

      // Ici j'initialise un tableau bytes32 avec des données fictives
        bytes32[3] memory data = [
            bytes32("one"),
            bytes32("two"),
            bytes32("three")
        ];

        //Je déploie le contrat Privacy avec ces données.
        Privacy privacy = new Privacy(data);

        console.log("Locked:", privacy.locked());

    // J'extrait la clé nécessaire pour déverrouiller le contrat à partir de data[2].
        bytes16 key = bytes16(data[2]);

        privacy.unlock(key);

        console.log("Locked:", privacy.locked());
    }
    
}