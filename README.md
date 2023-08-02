# String Utils Library for Solidity

# About
This is a comprehensive string utils library for processing and programmatically working with strings. This library is focused on making the use of strings more user-friendly, or programmer friendly.

The gas cost for implementing various operations would definitely defer, depending on the size and length of the string being processed. For large strings, pre-processing is advised, so as to reduce the gas cost. Operations like toLowerCase, toUpperCase and isEqualCase, consumes much more gas than other operations, and is advised to be used wisely, preferably on smaller strings.

All functions are written with simplicity in mind, and should be easy to use and implement, please feel free to make any request or update for request to me, it's still a work in progress, and this contribution is important to the Web3 Community. Code Away  


# Getting started
install this library by running this on your terminal
```foundry
forge install OsoTega/string-utils-lib --no-commit
```

# Examples
## Importing to Project
import the library at the top of the contract you want to use it in
```solidity
import {StringUtilsLib} from "string-utils-lib/StringUtilsLib.sol"

contract UseContract{
    using StringUtilsLib for string;

    //...
}
```

## Splitting a string
The split function from the library returns a string array of all the splitted parts. The function takes in two arguements (besides the string),
1. The string by which the splitting is done,
2. a number larger than the length of the string to be splitted, (a proposed length for the string array);

```solidity
string memory a = "abc/cbd/han";
string[] memory newtext = a.split("/", 10);

//expected result is [abc, cbd, han]
```
as seen above, the expected result is lesser than 10 (the proposed length of the array),which should always be the case.


## The length of a string
The length function returns the length of an ASCII string

```solidity
string memory a = "abc/cbd/han";
uint256 b = a.length();

//expected result is 11
```


## Checking of a string contains another string
The includes function from the library returns a bool if the string searched for is found inside the string searched . The function takes in an arguement (besides the string),
1. The string searched for,

```solidity
string memory a = "abc/cbd/han";
bool newtext = a.includes("/");

//expected result is true
```

## Replacing a string in a string
The replaceOne function from the library returns a new string with the replaced string. The function replaces the first occurrence of the string to replace. The function takes in two arguements (besides the string),
1. The string to look out for,
2. The string to replace the one being looked out for

```solidity
string memory a = "abc/cbd/han";
string memory newtext = a.replaceOne("/", "1");

//expected result is abc1cbd/han/
```

## Replacing all occurrence of a string in a string
The replaceAll function from the library returns a new string with the replaced string. The function replaces all occurrence of the string to replace. The function takes in two arguements (besides the string),
1. The string to look out for,
2. The string to replace the one being looked out for

```solidity
string memory a = "abc/cbd/han";
string memory newtext = a.replaceAll("/", "1");

//expected result is abc1cbd1han1
```

## Match a string to another string
The matchStr function handles this operation. The function matches a given string argument with the string, and returns an object containing a bool (if the argument string exist) and a uint256 (the location of the string). The function takes in an arguement(besides the string),
1. The string to match with,

```solidity
string memory a = "abc/*cbd/*han";
return a.matchStr("ab");

//expected result is (true, 0)
```

## Padding a string
The padStart and padEnd functions handles this operation. The functions appends an input string to the start and the end of the string. The functions takes in two arguements(besides the string),
1. The string to pad with,
2. The expected length of the new string

```solidity
//Padding Start

string memory a = "abc";
return a.padStart(5, "1");

//expected result is 11abc

//Padding End

string memory a = "abc";
return a.padEnd(5, "1");

//expected result is abc11
```

## Changing a string to uppercase or lowercase
The toUpperCase and toLowerCase functions handles this operation. The functions converts the given string to upper case and to lower case. This function is to be used carefully, as it can easily be misused. If not used carefully, it can cost too much gas. It is advised to use this functions on smaller length strings.

```solidity
//Lower Case

string memory a = "ABC";
return a.toLowerCase();

//expected result is abc

//Upper Case

string memory a = "abc";
return a.toUpperCase();

//expected result is ABC
```

## Repeat a string
The repeat function repeats a string as many times stated. The function takes in an arguement
1. the repeat length

```solidity
//Lower Case

string memory a = "abc";
return a.repeat(4);

//expected result is abcabcabcabc
```

## Slicing a string or creating a substring
The slice and substring functions from the library returns a new string with the sliced and substring. The slice function returns a new string without the specified start and end indexes, and the substring function returns a new string from the start to the end index. The functions takes in two arguements (besides the string),
1. The start index,
2. The end index

```solidity
//Slice

string memory a = "abc";
return a.slice(1, 1);

//expected result is ac

//SubString

string memory a = "abcs";
return a.substring(1, 2);

//expected result is bc
```

## Compare strings
The isEqual and isEqualCase functions from the library returns a bool if the argument string is equal to the string. The isEqual checks only characters, and the isEqualCase checks both the case and characters. The isEqualCase functions also needs to be used carefully, it is advised to be used with small strings. The functions takes in an arguement (besides the string),
1. The string to compare,

```solidity
//isEqual

string memory a = "abcs";
return a.isEqual("abcs");

//expected result is true

//isEqualCase

string memory a = "abcs";
return a.isEqualCase("abcs");

//expected result is true
```

## Trim strings
The trim function removes unwanted space from the start and end of the string. The trimStart function also and the trimEnd removes spaces from the start and end of the string.

```solidity
//trimStart

string memory a = " abcs";
return a.trimStart();

//expected result is abcs

//trimEnd

string memory a = "abcs ";
return a.trimEnd();

//expected result is abcs

//trim

string memory a = "abcs ";
return a.trim();

//expected result is abcs
```

## Character at an index
The charAt function retrieves a char string at an index. The function takes in an arguement.

1. The index

```solidity
string memory a = "abcs";
return a.charAt(2);

//expected result is c
```

## The index of a character
The indexOf function retrieves the index of a string character. The function takes in an arguement.

1. The character (as a string)

```solidity
//index of
string memory a = "abcs";
return a.indexOf("b");

//last index of
string memory a = "abcbsbt";
return a.lastIndexOf("b");

//expected result is 5
```

## All the indexes of a character
The allIndexOf function retrieves all the indexes of a string character. The function takes in two arguement and returns a uint256 array of all the indexes.

1. The character (as a string)
2. The proposed length of the out array (This should be larger than the string)

```solidity
string memory a = "abcbsnncb";
return a.allIndexOf("b", 10);

//expected result is [1,3,8]
```

## Check if string starts with a string
The startsWith function checks if the first characters in a string equals the arguement. The function takes in an arguement and returns a bool.

1. The startsWith string

```solidity
string memory a = "abcbsnncb";
return a.startsWith("abc");

//expected result is true
```

## Check if string ends with a string
The endsWith function checks if the end characters in a string equals the arguement. The function takes in an arguement and returns a bool.

1. The endsWith string

```solidity
string memory a = "abcbsnncb";
return a.endsWith("ncb");

//expected result is true
```

## Convert a string of numbers to a number
The parseInt function converts the string of numbers to a uint256 number. The function takes in an arguement and returns a uint256 number.

1. The string

```solidity
string memory a = "123412304502212123";
return a.parseInt();

//expected result is 123412304502212123 as a uint256
```

## Convert a number to a string
The parseString function converts the number to a string. The function takes in an arguement and returns a string.

1. The number

```solidity
uint256 a = 123412304502212123;
return StringUtilsLib.parseString(a);

//expected result is 123412304502212123 as a string
```




## Requirements
The contract was written using solidity ^0.8.18

