// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartSign {
    // Map with key as the participant's wallet addresses
    // bool is if they've signed the contract or not
    mapping(address => bool) public users;
    uint256 public contractCreationDate;

    // The hash to the encrypted blob in walrus storage
    string public generatedContractBlob;

    uint256 public contractDeadline;

    uint256 private constant TWO_HOURS_IN_SECS = 7200;

    constructor(address _counterParty, string memory _generatedContractBlob) {
        contractCreationDate = block.timestamp;
        users[msg.sender] = false;
        users[_counterParty] = false;
        generatedContractBlob = _generatedContractBlob;
        contractDeadline = contractCreationDate + TWO_HOURS_IN_SECS;
    }

    function sign() public {
        require(!users[msg.sender], "User has already signed");
        users[msg.sender] = true;
    }
}