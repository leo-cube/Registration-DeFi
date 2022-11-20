// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Admin is Initializable, UUPSUpgradeable, OwnableUpgradeable{
    /*
        It saves bytecode to revert on custom errors instead of using require
        statements. We are just declaring these errors for reverting with upon various
        conditions later in this contract. Thanks, Chiru Labs!
    */
    error addressAlreadyRegistered();
    
    mapping(address => bool) private isAdmin;
    address[] private pushAdmin;

    function initialize() initializer public{
      ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
       __Ownable_init();
       __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    function AdminLogin() external{
        if(isAdmin[msg.sender] == true){ revert addressAlreadyRegistered();}
        isAdmin[msg.sender] = true;
        pushAdmin.push(msg.sender);
    }

    function VerifyAdmin(address _ad) external view returns(bool condition){
        if(isAdmin[_ad]){
            return true;
        }else{
            return false;
        }
    }

    function GetAllAdminAddress() external view returns(address[] memory){
        return pushAdmin;
    }    
}