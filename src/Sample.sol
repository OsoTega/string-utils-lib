//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {StringUtilsLib} from "./StringUtilsLib.sol";

contract Sample {
    using StringUtilsLib for string;

    function exampleString() public pure returns (bool) {
        return string("abc").includes("ab");
    }

    function exampleStringCheck() public pure returns (string[] memory) {
        return string("abc/cbd/han").split("/", 10);
    }

    function exampleStringSpaceCheck() public pure returns (string[] memory) {
        return string("abc + cbd").split(" ", 10);
    }

    function exampleStringCheckOne() public pure returns (string memory) {
        string memory a = "abc/cbd/han";
        string memory newtext = a.replaceOne("/", "1");
        return newtext;
    }

    function exampleStringCheckAll() public pure returns (string memory) {
        string memory a = "abc/*cbd/*han";
        string memory newtext = a.replaceAll("/*", "1");
        return newtext;
    }

    function exampleStringMatchString()
        public
        pure
        returns (bool exist, int256 start)
    {
        string memory a = "abc/*cbd/*han";
        return a.matchStr("ab");
    }

    function exampleStringStartPad() public pure returns (string memory) {
        string memory a = "abc";
        return a.padStart(5, "1");
    }

    function exampleStringEndPad() public pure returns (string memory) {
        string memory a = "abc";
        return a.padEnd(5, "1");
    }

    function exampleStringToLowerCase() public pure returns (string memory) {
        string memory a = "ABC";
        return a.toLowerCase();
    }

    function exampleStringToUpperCase() public pure returns (string memory) {
        string memory a = "abc";
        return a.toUpperCase();
    }

    function exampleSliceString() public pure returns (string memory) {
        string memory a = "abc";
        return a.slice(1, 1);
    }

    function exampleSubString() public pure returns (string memory) {
        string memory a = "abcs";
        return a.substring(1, 2);
    }

    function exampleCompareString() public pure returns (bool) {
        string memory a = "abcs";
        return a.isEqual("abcs");
    }

    function exampleCompareCaseString() public pure returns (bool) {
        string memory a = "abcs";
        return a.isEqualCase("abcs");
    }

    function exampleTrimStartString() public pure returns (string memory) {
        string memory a = " abcs";
        return a.trimStart();
    }

    function exampleTrimEndString() public pure returns (string memory) {
        string memory a = "abcs ";
        return a.trimEnd();
    }

    function exampleCharAtString() public pure returns (string memory) {
        string memory a = "abcs";
        return a.charAt(2);
    }

    function exampleIndexOfString() public pure returns (uint256) {
        string memory a = "abcs";
        return a.indexOf("b");
    }

    function exampleAllIndexOfString() public pure returns (uint256[] memory) {
        string memory a = "abcbsnncb";
        return a.allIndexOf("b", 10);
    }

    function exampleStartsWithString() public pure returns (bool) {
        string memory a = "abcbsnncb";
        return a.startsWith("abc");
    }

    function exampleEndsWithString() public pure returns (bool) {
        string memory a = "abcbsnncb";
        return a.endsWith("ncb");
    }

    function exampleParseString() public pure returns (uint256) {
        string memory a = "123412304502212123";
        return a.parseInt();
    }
}
