//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {Sample} from "../src/Sample.sol";

contract StringUtilsTest is Test {
    Sample sample;

    function setUp() external {
        sample = new Sample();
    }

    function testCanWorkWithString() public {
        bool ba = sample.exampleString();
        assertEq(ba, true);
    }

    function testCanWorkWithStringExample() public {
        string[] memory ba = sample.exampleStringCheck();
        assertEq(ba.length, 3);
    }

    function testSpaceCheck() public {
        string[] memory ba = sample.exampleStringSpaceCheck();
        assertEq(ba[0], "abc");
        assertEq(ba[1], "+");
        assertEq(ba[2], "cbd");
    }

    function testCanReplaceOneString() public {
        string memory a = sample.exampleStringCheckOne();
        assertEq(a, "abc1cbd/han");
    }

    function testCanReplaceAllString() public {
        string memory a = sample.exampleStringCheckAll();
        assertEq(a, "abc1cbd1han");
    }

    function testCanMatchString() public {
        (bool exist, int256 start) = sample.exampleStringMatchString();
        assertEq(exist, true);
        assertEq(start, 0);
    }

    function testCanPadStringStart() public {
        string memory a = sample.exampleStringStartPad();
        assertEq(a, "11abc");
    }

    function testCanPadStringEnd() public {
        string memory a = sample.exampleStringEndPad();
        assertEq(a, "abc11");
    }

    function testStringToLowerCase() public {
        string memory a = sample.exampleStringToLowerCase();
        assertEq(a, "abc");
    }

    function testStringToUpperCase() public {
        string memory a = sample.exampleStringToUpperCase();
        assertEq(a, "ABC");
    }

    function testStringSlice() public {
        string memory a = sample.exampleSliceString();
        assertEq(a, "ac");
    }

    function testSubString() public {
        string memory a = sample.exampleSubString();
        assertEq(a, "bc");
    }

    function testEqualString() public {
        bool a = sample.exampleCompareString();
        assertEq(a, true);
    }

    function testEqualCaseString() public {
        bool a = sample.exampleCompareCaseString();
        assertEq(a, true);
    }

    function testTrimStartString() public {
        string memory a = sample.exampleTrimStartString();
        assertEq(a, "abcs");
    }

    function testTrimEndString() public {
        string memory a = sample.exampleTrimEndString();
        assertEq(a, "abcs");
    }

    function testCharAtString() public {
        string memory a = sample.exampleCharAtString();
        assertEq(a, "c");
    }

    function testIndexOfString() public {
        uint256 a = sample.exampleIndexOfString();
        assertEq(a, 1);
    }

    function testAllIndexOfString() public {
        uint256[] memory a = sample.exampleAllIndexOfString();
        assertEq(a[0], 1);
        assertEq(a[1], 3);
        assertEq(a[2], 8);
    }

    function testStartsWithString() public {
        bool a = sample.exampleStartsWithString();
        assertEq(a, true);
    }

    function testEndsWithString() public {
        bool a = sample.exampleEndsWithString();
        assertEq(a, true);
    }

    function testParseString() public {
        uint256 a = sample.exampleParseString();
        console.log(a);
        assertEq(a, 123412304502212123);
    }
}
