// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract IfArrayMap {
    mapping(uint256 => uint256) m;
    mapping(uint256 => function(uint256,uint256) pure returns (uint256)) m2;
    constructor() {
        m[0] = 0;
        m[1] = 1;
        m2[0] = add;
    }
    uint8[2] ar2 = [0, 1];

    // 21985
    function arr(uint256 i) public pure returns (uint256) {
        uint8[2] memory ar = [0, 1];
        return ar[i];
    }

    // 24056
    function arr2(uint256 i) public view returns (uint256) {
        return ar2[i];
    }

    // 23990
    function arr3(uint256 i) public view returns (uint256) {
        unchecked {
            return ar2[i];
        }
    }

    // 23994
    function map(uint256 i) public view returns (uint256) {
        return m[i];
    }

    // 23995
    function map2(uint256 i) public view returns (uint256) {
        unchecked {
            return m[i];
        }
    }

    // true: 22439
    // false: 22429
    // test,addのみのコントラクトの場合: true: 22373/ false:22363
    function test(uint256 a, uint256 b) public pure returns (uint256) {
        if (a == b) {
            return add(a, b);
        }
        return add(a, b);
    }

    // 22500
    function test2(uint256 a, uint256 b) public pure returns (uint256) {
        function(uint256,uint256) pure returns (uint256)[1] memory x = [add];
        return x[0](a,b);
    }

    // 24599
    function test3(uint256 a, uint256 b) public view returns (uint256) {
        return m2[0](a,b);
    }

    function add(uint256 a, uint256 b) private pure returns (uint256) {
        return a + b;
    }
}
