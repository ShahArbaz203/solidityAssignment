// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract EnrollStudents {
    address private owner;
    uint256 public collectedFee = 0;
    
    mapping(address => Student) private studentRecord; 
     
    constructor(){
         owner = msg.sender;
     }
     
     struct Student {
         address ethAddress;
         string name;
         bool hasBSDegree;
     }
     
     enum classType {
         ONLINE,
         ONSITE
     }
     
     enum gender {
         MALE,
         FEMALE
     }
     
     function registerStudent
     (string memory _name, bool _hasBSDegree)
     public payable {
         require(msg.value >= 2000000000000000000);
         Student memory newStudent = Student(msg.sender, _name, _hasBSDegree);
         studentRecord[msg.sender] = newStudent;
         collectedFee = collectedFee + 2;
     }
}
