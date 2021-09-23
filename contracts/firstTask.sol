pragma solidity ^0.4.17;

contract firstTask {
    function firsTask() public {}

    function sum(string memory a, string memory b)
        public
        pure
        returns (string memory)
    {
        bytes memory byteStringA = bytes(a);
        bytes memory byteStringB = bytes(b);

        uint256 length = 0;
        if (byteStringA.length > byteStringB.length) {
            length = byteStringA.length + 1;
        } else {
            length = byteStringB.length + 1;
        }
        bytes memory answer = new bytes(length);

        uint256 index = 0;
        int256 indexA = int256(byteStringA.length) - 1;
        int256 indexB = int256(byteStringB.length) - 1;
        uint8 balance = 0;

        while (indexA >= 0 && indexB >= 0) {
            uint8 newNumber = uint8(byteStringA[uint256(indexA)]) +
                uint8(byteStringB[uint256(indexB)]) -
                uint8(96) +
                balance;
            balance = newNumber / 10;
            newNumber = newNumber % 10;

            answer[length - 1 - index] = bytes1(newNumber + 48);
            index++;
            indexA--;
            indexB--;
        }

        while (indexA >= 0) {
            newNumber =
                uint8(byteStringA[uint256(indexA)]) +
                balance -
                uint8(48);

            balance = newNumber / 10;
            newNumber = newNumber % 10;

            answer[length - 1 - index] = bytes1(newNumber + 48);
            index++;
            indexA--;
        }

        while (indexB >= 0) {
            newNumber =
                uint8(byteStringB[uint256(indexB)]) +
                balance -
                uint8(48);

            balance = newNumber / 10;
            newNumber = newNumber % 10;

            answer[length - 1 - index] = bytes1(newNumber + 48);
            index++;
            indexB--;
        }

        if (balance > 0) {
            answer[length - 1 - index] = bytes1(balance + 48);
            ++index;
        }

        bytes memory finalAnswer = new bytes(index);
        for (uint256 i = 0; i < index; ++i) {
            finalAnswer[i] = bytes1(answer[length - index + i]);
        }
        return string(finalAnswer);
    }
}
