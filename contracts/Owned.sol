pragma solidity ^0.4.15;

// ----------------------------------------------------------------------------
// HAZ 'Hazza Network Token' contract ownership
//
// Refer to http://hazza.network for further information.
//
// Enjoy. (c) ANX International and BokkyPooBah / Bok Consulting Pty Ltd 2017.
// The MIT Licence.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {

    // ------------------------------------------------------------------------
    // Current owner, and proposed new owner
    // ------------------------------------------------------------------------
    address public owner;
    address public newOwner;

    // ------------------------------------------------------------------------
    // Constructor - assign creator as the owner
    // ------------------------------------------------------------------------
    function Owned() {
        owner = msg.sender;
    }


    // ------------------------------------------------------------------------
    // Modifier to mark that a function can only be executed by the owner
    // ------------------------------------------------------------------------
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }


    // ------------------------------------------------------------------------
    // Owner can initiate transfer of contract to a new owner
    // ------------------------------------------------------------------------
    function transferOwnership(address _newOwner) onlyOwner {
        newOwner = _newOwner;
    }

 
    // ------------------------------------------------------------------------
    // New owner has to accept transfer of contract
    // ------------------------------------------------------------------------
    function acceptOwnership() {
        require(msg.sender == newOwner);
        owner = newOwner;
        OwnershipTransferred(owner, newOwner);
    }
    event OwnershipTransferred(address indexed _from, address indexed _to);
}