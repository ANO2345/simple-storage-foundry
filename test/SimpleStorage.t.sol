//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testStoreAndRetrieve() public {
        simpleStorage.store(42);
        assertEq(simpleStorage.retrieve(), 42);
    }

    function testInitialValueIsZero() public {
        assertEq(simpleStorage.retrieve(), 0);
    }
}

