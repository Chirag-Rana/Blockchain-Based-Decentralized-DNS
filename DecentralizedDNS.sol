// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DecentralizedDNS {

    // Structure to hold DNS records
    struct DNSRecord {
        address owner;
        string a_record;    // For IP addresses (A records)
        string cname_record; // For canonical names (CNAME records)
        string txt_record;   // For text records (TXT records)
    }

    // Mapping from a domain name hash to its DNSRecord
    mapping(bytes32 => DNSRecord) public records;

    // Event to announce a new domain registration
    event DomainRegistered(string domainName, address owner);
    // Event to announce a record update
    event RecordUpdated(string domainName, string recordType);

    // Modifier to ensure only the domain owner can make changes
    modifier onlyOwner(string memory _domainName) {
        bytes32 domainHash = keccak256(abi.encodePacked(_domainName));
        require(records[domainHash].owner == msg.sender, "Caller is not the owner");
        _;
    }

    /**
     * @notice Registers a new domain name to the caller's address.
     * @param _domainName The domain to register, e.g., "myteam.blockchain".
     */
    function registerDomain(string memory _domainName) public {
        bytes32 domainHash = keccak256(abi.encodePacked(_domainName));
        // Ensure the domain is not already taken
        require(records[domainHash].owner == address(0), "Domain is already registered");

        records[domainHash].owner = msg.sender;
        emit DomainRegistered(_domainName, msg.sender);
    }

    /**
     * @notice Updates the A record (IP address) for a domain.
     * @param _domainName The domain to update.
     * @param _aRecord The new IP address.
     */
    function updateARecord(string memory _domainName, string memory _aRecord) public onlyOwner(_domainName) {
        bytes32 domainHash = keccak256(abi.encodePacked(_domainName));
        records[domainHash].a_record = _aRecord;
        emit RecordUpdated(_domainName, "A");
    }

    /**
     * @notice Updates the CNAME record for a domain.
     * @param _domainName The domain to update.
     * @param _cnameRecord The new CNAME value.
     */
    function updateCNAMERecord(string memory _domainName, string memory _cnameRecord) public onlyOwner(_domainName) {
        bytes32 domainHash = keccak256(abi.encodePacked(_domainName));
        records[domainHash].cname_record = _cnameRecord;
        emit RecordUpdated(_domainName, "CNAME");
    }

    /**
     * @notice Updates the TXT record for a domain.
     * @param _domainName The domain to update.
     * @param _txtRecord The new TXT value.
     */
    function updateTXTRecord(string memory _domainName, string memory _txtRecord) public onlyOwner(_domainName) {
        bytes32 domainHash = keccak256(abi.encodePacked(_domainName));
        records[domainHash].txt_record = _txtRecord;
        emit RecordUpdated(_domainName, "TXT");
    }

    /**
     * @notice Retrieves all records for a given domain.
     * @param _domainName The domain to look up.
     * @return The owner address and all record strings.
     */
    function getRecords(string memory _domainName) public view returns (address, string memory, string memory, string memory) {
        bytes32 domainHash = keccak256(abi.encodePacked(_domainName));
        DNSRecord storage record = records[domainHash];
        return (record.owner, record.a_record, record.cname_record, record.txt_record);
    }
}