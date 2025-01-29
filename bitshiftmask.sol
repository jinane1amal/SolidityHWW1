// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract BitShiftMask {
    /**
     * @dev Extracts bit values from a uint8 and returns an array of their decimal equivalents.
     * @param num The uint8 number to extract bits from.
     * @return resultArray The array of decimal values representing active bits.
     */
    function bitMasking(uint8 num) public pure returns (uint8[] memory) {
        uint8[8] memory tempArray; // Temporary fixed-size array to store results
        uint8 mask = 1; // Initial mask (00000001)
        uint8 count = 0; // Counter for active bits

        for (uint8 i = 0; i < 8; i++) {
            if (num & mask != 0) {
                tempArray[count] = mask; // Store the decimal value of the active bit
                count++; // Move to the next index
            }
            mask <<= 1; // Left shift the mask (1, 2, 4, 8, 16, 32, 64, 128)
        }

        // Create a properly sized array based on count
        uint8[] memory resultArray = new uint8[](count);
        for (uint8 j = 0; j < count; j++) {
            resultArray[j] = tempArray[j]; // Copy values into new array
        }

        return resultArray;
    }
}

