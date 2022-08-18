// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./base64.sol";

contract OnchainBashoRender is Ownable {
    bytes10 private constant _DIGITS = "0123456789";

    uint8 private abashoIndex = 0;
    mapping(uint8 => bytes) private abashos;
    mapping(uint8 => string) private abashoNames;

    function tokenURI(uint8 index) public view virtual returns (string memory) {
        bytes memory out = abi.encodePacked('<svg xmlns="http://www.w3.org/2000/svg" witdh="640" height="640" viewBox="0 0 16 16">');
        bytes memory abasho = abashos[index];

        for (uint y = 0; y < 16; y++) {
            for (uint x = 0; x < 16; x++) {
                out = abi.encodePacked(out, '<rect x="', str(x), '" y="', str(y), '" width="1" height="1" fill="', rgb(x, y, abasho), '"/>');
            }
        }

        out = abi.encodePacked(out, '</svg>');
        return string(abi.encodePacked('data:image/svg+xml;base64,', Base64.encode(out)));
    }

    function addAbasho(bytes memory art, string memory name) external {
        abashos[abashoIndex] = art;
        abashoNames[abashoIndex] = name;
        abashoIndex++;
    }

    function rgb(uint x, uint y, bytes memory abasho) internal pure returns (bytes memory) {
        uint pos = 48*y + 3*x;
        uint s = 32 - (x+y);

        return abi.encodePacked('rgb(', 
            str(s + uint8(abasho[pos])), ',', str(s + uint8(abasho[pos+1])), ',', str(s + uint8(abasho[pos+2])), 
        ')');
    }

    function str(uint value) internal pure returns (bytes memory) {
        if (value == 0) {
            return "0";
        }
        uint temp = value;
        uint digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = _DIGITS[value % 10];
            value /= 10;
        }
        return buffer;
    }
}