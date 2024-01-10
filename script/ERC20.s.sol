// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";

import {ERC20,ERC20FixedSupply} from  "../src/ERC20.sol";

contract ERC20Script is Script {

    address internal address_user1;
    address internal address_user2;
    address internal address_user3;
    address internal address_user4;

    function setUp() public{
      address_user1=makeAddr("address_user1");
      address_user2=makeAddr("address_user2");
      address_user3=makeAddr("address_user3");
      address_user4=makeAddr("address_user4");
      
      // deal(address(this), address_user1,25e18);
      // deal(address(this), address_user2,25e18);
      // deal(address(this), address_user3,25e18);
      // deal(address(this), address_user4,25e18);
    }

    function run() public {
        
        uint256 key=vm.envUint("PRIVATE_KEY");
        setUp();
        vm.startBroadcast(key);
    
       
    
        ERC20 myERC20= new ERC20("Name", "SYM",18);
       //new ERC20("Name", "SYM",18);
        new ERC20FixedSupply(100e18);
        vm.prank(address(this));
         //vm.prank(msg.sender);
        myERC20.transfer(address_user1, 25e18);
        myERC20.transfer(address_user2, 25e18);
        myERC20.transfer(address_user3, 25e18);
        myERC20.transfer(address_user4, 25e18);


         vm.stopBroadcast();
    }

}