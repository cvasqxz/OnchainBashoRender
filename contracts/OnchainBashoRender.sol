// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./base64.sol";

contract OnchainBashoRender is Ownable {

    function tokenURI() public view virtual returns (string memory) {
    bytes memory output;

        for (uint x = 0; x < 16; x++) {
            for (uint y = 0; y < 16; y++) {
                output = abi.encodePacked(output, "miau");
            }
        }
        return string(Base64.encode(output));
    }
}
