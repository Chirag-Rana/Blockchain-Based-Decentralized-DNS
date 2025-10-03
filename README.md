# Blockchain-Based Decentralized DNS System 🌐
*Project by Team VCRAM under the guidance of Dr. Ranjeet Ranjan Jha for the course Computer Networks (MA3105)*

Team members:-

Veda Laxman (2302MC10)

Chirag Rana (2302MC03)

Rishit Dutta (2302MC07)

Anirudh Reddy (2302MC01)

Mahipal Maddu (2301MC15)

## 📜 Overview

This project is a decentralized Domain Name System (DNS) built on the Ethereum blockchain. It aims to address critical security vulnerabilities in traditional DNS, such as DNS poisoning, censorship, and single points of failure. By using a smart contract for domain registration and record management, we can create a more resilient and censorship-resistant alternative to conventional internet infrastructure.

The core of the system is a Solidity smart contract deployed on the Sepolia testnet that allows users to register domains and manage their associated A, CNAME, and TXT records.

***

## 👥 Team Roles

This project is being developed by a team of 5 members with the following roles:
* **Smart Contract Development (2 Members):** Responsible for writing, testing, and deploying the core domain registration logic on the blockchain.
* **DNS Resolver Service (1 Member):** Develops the backend service that handles DNS queries by reading data from the smart contract.
* **Frontend Interface (1 Member):** Creates the user-facing web interface for domain registration and management.
* **Integration & Documentation (1 Member):** Manages system integration, end-to-end testing, and project documentation.

***

## 🛠️ Technology Stack

* **Blockchain:** Ethereum (Sepolia Testnet) 
* **Smart Contracts:** Solidity 
* **DNS Resolver:** Node.js 
* **Frontend:** React.js 
* **Development Tools:** Remix IDE, MetaMask 
* **Protocols:** DNS (RFC 1035), JSON-RPC, HTTP/S 

***

## 📄 Smart Contract Details

The smart contract is the single source of truth for all domain registrations.

* **Network:** Sepolia Testnet
* **Contract Address:** `0xa235e4135021b6a362E4506031aEe267Bc111b2C`
* **ABI:** The contract's Application Binary Interface (ABI) is required for frontend/backend integration and can be found in the `abi.json` file in this repository. 

### Key Functions
* `registerDomain(string memory _domainName)`: Registers a new domain to the caller's address.
* `updateARecord(string memory _domainName, string memory _aRecord)`: Updates the IP address (A record) for a domain. Restricted to the domain owner. 
* `updateCNAMERecord(...)`: Updates the CNAME record. Restricted to the domain owner. 
* `updateTXTRecord(...)`: Updates the TXT record. Restricted to the domain owner. 
* `getRecords(string memory _domainName)`: Retrieves all records for a given domain.

***

## 🚀 Project Deliverables

The expected outcomes for this project include:

1.  **A Working System:** A fully functional prototype including the smart contract, DNS resolver, and web interface. 
2.  **Complete Source Code:** This GitHub repository containing all documented code. 
3.  **Technical Report:** A 6-8 page implementation and analysis document. 
4.  **Live Presentation:** A 15-minute demo of the working system. 
