//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { FundMe } from "../src/FundMe.sol";
import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import { HelperConfig } from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        FundMe fundMe = new FundMe(AggregatorV3Interface(ethUsdPriceFeed));
        vm.stopBroadcast();
        return fundMe;
    }
    // function setUp() external {
    //     vm.startBroadcast();
    //     FundMe fundMe = new FundMe();
    //     vm.stopBroadcast();
    // } 
}