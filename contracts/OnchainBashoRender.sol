// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./base64.sol";

contract OnchainBashoRender is Ownable {

    function tokenURI() public view virtual returns (string memory) {
        bytes memory out = abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" witdh="640" height="640" viewBox="0 0 640 640">');

        for (uint y = 0; y < 16; y++) {
            for (uint x = 0; x < 16; x++) {
                out = abi.encodePacked(out, '<rect x="', Strings.toString(x*40), '" y="', Strings.toString(y*40), '" width="40" height="40" fill="rgb(', Strings.toString((x+y)*8), ',', Strings.toString((x+y)*8), ',', Strings.toString((x+y)*8), ')"/>');
            }
        }

        out = abi.encodePacked(out, '</svg>');
        return string(abi.encodePacked('data:image/svg+xml;base64,', Base64.encode(out)));
    }
}
