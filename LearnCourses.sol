//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "only owner can call");
        _;
    }
}

contract LearnCourses is Owned {
    
    struct Instructor {
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => Instructor) instructors;
    address[] public instructorAccts;
    
    event instructorInfo(string fName, string lName, uint age);

    function setInstructor(address _address, uint _age, string memory _fName, string memory _lName) public onlyOwner {
        Instructor storage instructor = instructors[_address];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        
        instructorAccts.push(_address);
        emit instructorInfo(_fName, _lName, _age);

    }
    
    function getInstructors() view public returns(address[] memory) {
        return instructorAccts;
    }
    
    function getInstructor(address _address) view public returns (uint, string memory, string memory) {
        return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
    }
    
    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }
    
}