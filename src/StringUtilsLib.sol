//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

library StringUtilsLib {
    function split(
        string memory text,
        string memory char,
        uint256 proposedLength
    ) internal pure returns (string[] memory) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(char);
        string[] memory array = new string[](proposedLength);
        uint256 pointA = 0;
        uint256 i = 0;
        uint256 visiblePoint = 0;
        while (i < nt.length) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (uint256 a = i; a < (i + nc.length); a++) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            if (
                keccak256(abi.encodePacked(find)) ==
                keccak256(abi.encodePacked(char))
            ) {
                bytes memory findBytes1 = new bytes(i - pointA);
                uint256 count1 = 0;
                for (uint256 a = pointA; a < i; a++) {
                    findBytes1[count1] = bytes(text)[a];
                    count1++;
                }
                array[visiblePoint] = string(findBytes1);
                visiblePoint++;
                i += nc.length;
                pointA = i;
            } else {
                i += 1;
            }
        }
        string[] memory n_array = new string[](visiblePoint + 1);

        for (uint256 a = 0; a < (visiblePoint + 1); a++) {
            n_array[a] = array[a];
        }
        array = new string[](0);
        return n_array.length > 1 ? n_array : new string[](0);
    }

    function includes(
        string memory text,
        string memory search
    ) internal pure returns (bool) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(search);
        bool exist = false;
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (uint256 a = i; a < (i + nc.length); a++) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            if (
                keccak256(abi.encodePacked(find)) ==
                keccak256(abi.encodePacked(search))
            ) {
                exist = true;
                break;
            }
        }
        return exist;
    }

    function replaceOne(
        string memory text,
        string memory replace,
        string memory newtext
    ) internal pure returns (string memory) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(replace);
        bytes memory nrt = bytes(newtext);
        string memory replacedString = "";
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (uint256 a = i; a < (i + nc.length); a++) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            if (
                keccak256(abi.encodePacked(find)) ==
                keccak256(abi.encodePacked(replace))
            ) {
                bytes memory findBytes1 = new bytes(
                    (nt.length - nc.length) + nrt.length
                );
                uint256 count1 = 0;
                for (uint256 a = 0; a < i; a++) {
                    findBytes1[count1] = bytes(text)[a];
                    count1++;
                }
                for (uint256 a = 0; a < nrt.length; a++) {
                    findBytes1[count1] = bytes(newtext)[a];
                    count1++;
                }
                for (uint256 a = (i + nc.length); a < (nt.length); a++) {
                    findBytes1[count1] = bytes(text)[a];
                    count1++;
                }
                replacedString = string(findBytes1);
                break;
            }
        }
        return replacedString;
    }

    function replaceAll(
        string memory text,
        string memory replace,
        string memory newtext
    ) internal pure returns (string memory) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(replace);
        bytes memory nrt = bytes(newtext);
        string memory replacedString = "";
        uint256 i = 0;
        uint256 pointA = 0;
        while (i < nt.length) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (
                uint256 a = i;
                a <
                (
                    (nc.length > (nt.length - i))
                        ? (nt.length - i)
                        : (i + nc.length)
                );
                a++
            ) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            if (
                keccak256(abi.encodePacked(find)) ==
                keccak256(abi.encodePacked(replace))
            ) {
                bytes memory findBytes1 = new bytes((i - pointA) + nrt.length);
                uint256 count1 = 0;
                for (uint256 a = pointA; a < i; a++) {
                    findBytes1[count1] = bytes(text)[a];
                    count1++;
                }
                for (uint256 a = 0; a < nrt.length; a++) {
                    findBytes1[count1] = bytes(newtext)[a];
                    count1++;
                }
                replacedString = string.concat(
                    replacedString,
                    string(findBytes1)
                );
                i += nc.length;
                pointA = i;
            } else {
                i += 1;
            }
        }
        bytes memory findBytes2 = new bytes(nt.length - pointA);
        uint256 count2 = 0;
        for (uint256 a = pointA; a < nt.length; a++) {
            findBytes2[count2] = bytes(text)[a];
            count2++;
        }
        replacedString = string.concat(replacedString, string(findBytes2));
        return replacedString;
    }

    function matchStr(
        string memory text,
        string memory matchtext
    ) internal pure returns (bool exist, int256 start) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(matchtext);
        bool matchExist = false;
        int256 matchStart = -1;
        int256 count1 = 0;
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (uint256 a = i; a < (i + nc.length); a++) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            if (
                keccak256(abi.encodePacked(find)) ==
                keccak256(abi.encodePacked(matchtext))
            ) {
                matchExist = true;
                matchStart = count1;
                break;
            }
            count1++;
        }
        return (matchExist, matchStart);
    }

    function toLowerCase(
        string memory text
    ) internal pure returns (string memory) {
        string
            memory charsString = "Aa;Bb;Cc;Dd;Ee;Ff;Gg;Hh;Ii;Jj;Kk;Ll;Mm;Nn;Oo;Pp;Qq;Rr;Ss;Tt;Uu;Vv;Ww;Xx;Yy;Zz";
        string[] memory chars = split(charsString, ";", 40);
        bytes memory nt = bytes(text);
        string memory lowerCase = "";
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            bool exist = false;
            for (uint256 a = 0; a < chars.length; a++) {
                bool contains = includes(chars[a], string(findBytes));
                if (contains) {
                    bytes memory findBytes1 = new bytes(1);
                    findBytes1[0] = bytes(chars[a])[1];
                    lowerCase = string.concat(lowerCase, string(findBytes1));
                    exist = true;
                    break;
                }
            }
            if (exist == false) {
                lowerCase = string.concat(lowerCase, string(findBytes));
            }
        }
        return lowerCase;
    }

    function toUpperCase(
        string memory text
    ) internal pure returns (string memory) {
        string
            memory charsString = "Aa;Bb;Cc;Dd;Ee;Ff;Gg;Hh;Ii;Jj;Kk;Ll;Mm;Nn;Oo;Pp;Qq;Rr;Ss;Tt;Uu;Vv;Ww;Xx;Yy;Zz";
        string[] memory chars = split(charsString, ";", 40);
        bytes memory nt = bytes(text);
        string memory upperCase = "";
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            bool exist = false;
            for (uint256 a = 0; a < chars.length; a++) {
                bool contains = includes(chars[a], string(findBytes));
                if (contains) {
                    bytes memory findBytes1 = new bytes(1);
                    findBytes1[0] = bytes(chars[a])[0];
                    upperCase = string.concat(upperCase, string(findBytes1));
                    exist = true;
                    break;
                }
            }
            if (exist == false) {
                upperCase = string.concat(upperCase, string(findBytes));
            }
        }
        return upperCase;
    }

    function repeat(
        string memory text,
        uint256 repeatLength
    ) internal pure returns (string memory) {
        string memory repeatedString = "";
        for (uint256 i = 0; i < repeatLength; i++) {
            repeatedString = string.concat(repeatedString, text);
        }
        return repeatedString;
    }

    function padStart(
        string memory text,
        uint256 lengthCount,
        string memory padding
    ) internal pure returns (string memory) {
        string memory paddedString = "";
        bytes memory nt = bytes(text);
        for (
            uint256 i = 0;
            i <
            ((lengthCount > nt.length ? lengthCount : nt.length) - nt.length);
            i++
        ) {
            paddedString = string.concat(paddedString, padding);
        }
        return string.concat(paddedString, text);
    }

    function padEnd(
        string memory text,
        uint256 lengthCount,
        string memory padding
    ) internal pure returns (string memory) {
        string memory paddedString = "";
        bytes memory nt = bytes(text);

        for (
            uint256 i = 0;
            i <
            ((lengthCount > nt.length ? lengthCount : nt.length) - nt.length);
            i++
        ) {
            paddedString = string.concat(paddedString, padding);
        }
        return string.concat(text, paddedString);
    }

    function slice(
        string memory text,
        uint256 start,
        uint256 end
    ) internal pure returns (string memory) {
        bytes memory nt = bytes(text);
        bytes memory findBytes = new bytes(nt.length - ((end - 1) + start));
        uint256 count = 0;
        for (uint256 a = 0; a < start; a++) {
            findBytes[count] = bytes(text)[a];
            count++;
        }
        for (uint256 a = end + 1; a < nt.length; a++) {
            findBytes[count] = bytes(text)[a];
            count++;
        }
        string memory sliceString = string(findBytes);
        return sliceString;
    }

    function isEqual(
        string memory text,
        string memory compare
    ) internal pure returns (bool) {
        return (keccak256(abi.encodePacked(text)) ==
            keccak256(abi.encodePacked(compare)));
    }

    function isEqualCase(
        string memory text,
        string memory compare
    ) internal pure returns (bool) {
        return ((keccak256(abi.encodePacked(toUpperCase(text))) ==
            keccak256(abi.encodePacked(toUpperCase(compare)))) &&
            (keccak256(abi.encodePacked(toLowerCase(text))) ==
                keccak256(abi.encodePacked(toLowerCase(compare)))));
    }

    function substring(
        string memory text,
        uint256 start,
        uint256 end
    ) internal pure returns (string memory) {
        bytes memory findBytes = new bytes((end + 1) - start);
        uint256 count = 0;
        for (uint256 a = start; a < (end + 1); a++) {
            findBytes[count] = bytes(text)[a];
            count++;
        }
        string memory subString = string(findBytes);
        return subString;
    }

    function trimStart(
        string memory text
    ) internal pure returns (string memory) {
        bytes memory nt = bytes(text);
        uint256 i = 0;
        uint256 count = 0;
        while (i < nt.length) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            if (!isEqual(string(findBytes), " ")) {
                count = i;
                break;
            }
            i++;
        }
        string memory trimmedString = substring(text, count, nt.length - 1);
        return trimmedString;
    }

    function trimEnd(string memory text) internal pure returns (string memory) {
        bytes memory nt = bytes(text);
        uint256 i = nt.length - 1;
        uint256 count = 0;
        while (i >= 0) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            if (!isEqual(string(findBytes), " ")) {
                count = i;
                break;
            }
            i--;
        }
        string memory trimmedString = substring(text, 0, count);
        return trimmedString;
    }

    function trim(string memory text) internal pure returns (string memory) {
        string memory startTrim = trimStart(text);
        string memory trimmedString = trimEnd(startTrim);
        return trimmedString;
    }

    function charAt(
        string memory text,
        uint256 index
    ) internal pure returns (string memory) {
        bytes memory findBytes = new bytes(1);
        findBytes[0] = bytes(text)[index];
        return string(findBytes);
    }

    function indexOf(
        string memory text,
        string memory char
    ) internal pure returns (uint256) {
        bytes memory nt = bytes(text);
        uint256 count = 0;
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            if (isEqual(string(findBytes), char)) {
                count = i;
                break;
            }
        }
        return count;
    }

    function lastIndexOf(
        string memory text,
        string memory char
    ) internal pure returns (uint256) {
        bytes memory nt = bytes(text);
        uint256 count = 0;
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            if (isEqual(string(findBytes), char)) {
                count = i;
            }
        }
        return count;
    }

    function allIndexOf(
        string memory text,
        string memory char,
        uint256 proposedLength
    ) internal pure returns (uint256[] memory) {
        bytes memory nt = bytes(text);
        uint256[] memory array = new uint256[](proposedLength);
        uint256 visiblePoint = 0;
        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            if (isEqual(string(findBytes), char)) {
                array[visiblePoint] = i;
                visiblePoint++;
            }
        }
        uint256[] memory n_array = new uint256[](visiblePoint + 1);

        for (uint256 a = 0; a < (visiblePoint + 1); a++) {
            n_array[a] = array[a];
        }
        array = new uint256[](0);
        return n_array.length > 1 ? n_array : new uint256[](0);
    }

    function startsWith(
        string memory text,
        string memory start
    ) internal pure returns (bool) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(start);
        bool startsWidthString = false;
        if (nt.length > nc.length) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (uint256 a = 0; a < nc.length; a++) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            startsWidthString = isEqual(start, find);
        }
        return startsWidthString;
    }

    function endsWith(
        string memory text,
        string memory end
    ) internal pure returns (bool) {
        bytes memory nt = bytes(text);
        bytes memory nc = bytes(end);
        bool endsWidthString = false;
        if (nt.length > nc.length) {
            bytes memory findBytes = new bytes(nc.length);
            uint256 count = 0;
            for (uint256 a = (nt.length - nc.length); a < nt.length; a++) {
                findBytes[count] = bytes(text)[a];
                count++;
            }
            string memory find = string(findBytes);
            endsWidthString = isEqual(end, find);
        }
        return endsWidthString;
    }

    function parseInt(string memory text) internal pure returns (uint256) {
        uint256 number = 0;
        bytes memory nt = bytes(text);
        uint256[] memory numbers = new uint256[](10);
        numbers[0] = 0;
        numbers[1] = 1;
        numbers[2] = 2;
        numbers[3] = 3;
        numbers[4] = 4;
        numbers[5] = 5;
        numbers[6] = 6;
        numbers[7] = 7;
        numbers[8] = 8;
        numbers[9] = 9;

        string[] memory numbersString = new string[](10);
        numbersString[0] = "0";
        numbersString[1] = "1";
        numbersString[2] = "2";
        numbersString[3] = "3";
        numbersString[4] = "4";
        numbersString[5] = "5";
        numbersString[6] = "6";
        numbersString[7] = "7";
        numbersString[8] = "8";
        numbersString[9] = "9";

        for (uint256 i = 0; i < nt.length; i++) {
            bytes memory findBytes = new bytes(1);
            findBytes[0] = bytes(text)[i];
            string memory numberStringToCheck = string(findBytes);
            uint256 checkNum = 0;
            for (uint256 a = 0; a < numbersString.length; a++) {
                if (isEqual(numbersString[a], numberStringToCheck)) {
                    checkNum = a;
                    break;
                }
            }
            uint256 numberToParse = numbers[checkNum];
            string memory subString = substring(text, i, nt.length - 1);
            number += (numberToParse * (10 ** (bytes(subString).length - 1)));
        }
        return number;
    }

    function length(string memory text) internal pure returns (uint256) {
        bytes memory nt = bytes(text);
        return nt.length;
    }
}
