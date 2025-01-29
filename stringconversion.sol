// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract BinaryConverter {
    /**
     * @dev Converts a binary string to a decimal integer.
     * @param binaryString The input binary string.
     * @return decimalValue The converted decimal value.
     */
    function binaryToDecimal(string memory binaryString) public pure returns (uint256 decimalValue) {
        bytes memory binaryBytes = bytes(binaryString); // Convert string to bytes for easier indexing
        uint256 length = binaryBytes.length;

        for (uint256 i = 0; i < length; i++) {
            uint8 digit = uint8(binaryBytes[i]) - 48; // ASCII conversion: '0' -> 0, '1' -> 1
            require(digit == 0 || digit == 1, "Invalid binary character"); // Ensure binary input is valid
            decimalValue += digit * (2 ** (length - i - 1)); // Calculate the decimal value
        }

        return decimalValue;
    }
}
