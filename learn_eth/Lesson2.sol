pragma solidity ^0.5.1;

contract Lesson2 {
    /* An array of people 
    Person[] public people; */
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    struct Person {
        uint256 _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName)
        public
    {
        /* If people was an array, this is how you add to it 
        people.push(Person(_firstName, _lastName)); */

        people[peopleCount] = Person(peopleCount, _firstName, _lastName);

        peopleCount += 1;
    }
}
