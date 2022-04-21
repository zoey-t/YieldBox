// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;
import "../samples/salary.sol";
import "./utils/DSTestPlus.sol";
import "../mocks/WETH9Mock.sol";

contract Salary_test is DSTestPlus {
    // setup contracts
    WETH9Mock weth;
    YieldBoxURIBuilder yieldBoxURIBuilder;
    YieldBox yieldBox;
    
    Salary salary;
    

    // setup users
    address user0 = payable(address(0xAAAAAAA));
    address user1 = payable(address(0xBBBBBBB));
    address user2 = payable(address(0xCCCCCCC));

    function setup() public {
        // new contracts
        weth = new WETH9Mock();
        yieldBoxURIBuilder = new YieldBoxURIBuilder();
        yieldBox = new YieldBox(IWrappedNative(address(weth)), yieldBoxURIBuilder);
        salary = new Salary(yieldBox);

        // label contracts and user
        vm.label(address(weth), "weth");
        vm.label(address(yieldBoxURIBuilder), "yieldBoxURIBuilder");
        vm.label(address(yieldBox), "yieldBox");
        vm.label(address(salary), "salary");
        vm.label(user0, "user0");
        vm.label(user1, "user1");
        vm.label(user2, "user2");
    }
}