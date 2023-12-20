// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importing the necessary OpenZeppelin contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

// The SmilingShark contract inherits from ERC721, ERC721Enumerable, and ERC721URIStorage
contract SmilingShark is ERC721, ERC721Enumerable, ERC721URIStorage {
  // Private variable to keep track of the next token ID
  uint256 private _nextTokenId;
  // Public constant for the maximum supply of tokens
  uint256 public MAX_SUPPLY = 5;
  // Public variable to keep track of the current supply of tokens
  uint256 public currentSupply;
  // token uri
  string uri;

  // Constructor function that sets the name and symbol of the token
  constructor()
      ERC721("SmilingShark", "$SS")
  {
      // Initialize the next token ID to 1
      _nextTokenId = 1;

      // Initialize the token uri
      uri = "ipfs://QmTzUQyUXsJnLvVgrgnvoNxFkuprdwTZN7iwrUCLHbo8d6";
  }

    /**
    * @notice Mint a new token
    * @param to The address to mint the new token to
    * @return A message indicating the remaining supply
    */
  function safeMint(address to) public returns(string memory) {
      // Get the next token ID and increment it
      uint256 tokenId = _nextTokenId++;
      // Check if the maximum supply has been reached
      require(tokenId <= MAX_SUPPLY, "All Smiling Sharks have been minted!");
      // Mint the new token
      _safeMint(to, tokenId);
      // Set the URI for the new token
      _setTokenURI(tokenId, uri);
      // Increment the current supply
      currentSupply++;
      // Return a message indicating the remaining supply
      return string(abi.encodePacked("There are ", Strings.toString(currentSupply), " Smiling Sharks remaining!"));
  }

  // The following functions are overrides required by Solidity.

  /**
   * @notice Update the token
   * @param to The address to update the token to
   * @param tokenId The ID of the token
   * @param auth The address authorized to update the token
   * @return The address of the updated token
   */
  function _update(address to, uint256 tokenId, address auth)
      internal
      override(ERC721, ERC721Enumerable)
      returns (address)
  {
      // Call the parent contract's _update function
      return super._update(to, tokenId, auth);
  }

  /**
   * @notice Increase the balance of an account
   * @param account The address of the account
   * @param value The amount to increase the balance by
   */
  function _increaseBalance(address account, uint128 value)
      internal
      override(ERC721, ERC721Enumerable)
  {
      // Call the parent contract's _increaseBalance function
      super._increaseBalance(account, value);
  }

  /**
   * @notice Get the URI of a token
   * @param tokenId The ID of the token
   * @return The URI of the token
   */
  function tokenURI(uint256 tokenId)
      public
      view
      override(ERC721, ERC721URIStorage)
      returns (string memory)
  {
      // Call the parent contract's tokenURI function
      return super.tokenURI(tokenId);
  }

  /**
   * @notice Check if a contract supports an interface
   * @param interfaceId The ID of the interface
   * @return True if the contract supports the interface, false otherwise
   */
  function supportsInterface(bytes4 interfaceId)
      public
      view
      override(ERC721, ERC721Enumerable, ERC721URIStorage)
      returns (bool)
  {
      // Call the parent contract's supportsInterface function
      return super.supportsInterface(interfaceId);
  }
}
