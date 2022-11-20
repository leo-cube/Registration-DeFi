// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";

contract User is Ownable{
    /*
        It saves bytecode to revert on custom errors instead of using require
        statements. We are just declaring these errors for reverting with upon various
        conditions later in this contract. Thanks, Chiru Labs!
    */
    error addressAlreadyRegistered();
    address[] private pushUser;
    mapping(address => bool) private isUser;
    
    /**
        * Function Name: User 
        * msg.sender, the user logs address to the smart contract.
    */
    function UserLogin() external{
        if(isUser[msg.sender] == true){ revert addressAlreadyRegistered();}
        isUser[msg.sender] = true;
        pushUser.push(msg.sender);
    }

    /**
        *  Function Name: verifyUser 
        * @param _ad - Checks whether the address already exist in the contract or not.
    */
    function verifyUser(address _ad) external view returns(bool condition){
        if(isUser[_ad]){
            return true;
        }else{
            return false;
        }
    }

    /**
        * Returns all the users that are logged to the contract. 
    */
    function allUsers() external view returns(address[] memory){
        return pushUser;
    }
}