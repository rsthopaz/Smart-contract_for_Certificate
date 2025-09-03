// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract Certificate is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(address => uint8) userToTokenAmount;

    constructor() ERC721("Certificate", "AKTA") {
        _tokenIds.increment();
    }

    function safeMint() public {
        require(userToTokenAmount[msg.sender] < 5, "User already have 5 NFT");
        uint256 tokenID = _tokenIds.current();
        _safeMint(msg.sender, tokenID);
        _tokenIds.increment();
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bafybeidtjh2hynpikmoof4hx4cvnwzv4bwwvoztzzzbjljzac5gcvgxh5i";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory _tokenURI = string(abi.encodePacked(_baseURI(), "/", Strings.toString(tokenId), ".json"));
        return _tokenURI;
        // require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        // string memory baseURI = _baseURI();
        // return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, Strings.toString(tokenId), ".json")) : "";
    }


}