pragma solidity ^0.8.7;

contract firsTask{
    
    function sum(string memory a, string memory b) public pure returns(string memory)
    {
        bytes memory byteStringA = bytes(a);
        bytes memory byteStringB = bytes(b);
        
        uint length = 0;
        if (byteStringA.length > byteStringB.length){
            length = byteStringA.length + 1;
        } else{
            length = byteStringB.length + 1;
        }
        bytes memory answer = new bytes(length);
        
        uint index = 0;
        int indexA = int(byteStringA.length) - 1;
        int indexB = int(byteStringB.length) - 1;
        uint8 balance = 0;
        
        while(indexA >= 0 && indexB >= 0)
        {
            uint8 newNumber = uint8(byteStringA[uint(indexA)]) + uint8(byteStringB[uint(indexB)]) - uint8(96) + balance;
            if (newNumber > 9)
            {
                newNumber = newNumber % 10;
                balance = newNumber /10;
            }
            answer[length - 1 - index] = bytes1(newNumber + 48);
            index++;
            indexA--;
            indexB--;
        }
        
        while(indexA >= 0)
        {
            answer[length - 1 - index] = bytes1(uint8(byteStringA[uint(indexA)]) + 48 + balance);
            balance = 0;
            index++;
            indexA--;
        }
        
        while(indexB >= 0)
        {
            answer[length - 1 - index] = bytes1(uint8(byteStringB[uint(indexB)]) + 48 + balance);
            balance = 0;
            index++;
            indexB--;
        }
        
        if (balance > 0)
        {
            answer[length - 1 - index] = bytes1(balance);
        }
        
        return string(answer);
    }
}