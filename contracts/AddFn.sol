// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract AddFn {
    fallback() external { }

    // gas: 22339
    function test(uint256 a, uint256 b) public pure returns (uint256) {
        return add(a, b);
    }

    // 21937
    function test2(uint256 a, uint256 b) public pure returns (uint256) {
        assembly {
            let result := add(a, b)
            mstore(0x0, result)
            return(0x0, 32)
        }
    }

    function add(uint256 a, uint256 b) private pure returns (uint256) {
        return a + b;
    }
}

/***
 * Remix  test --------
 * 088 JUMP
 * 089 JUMPDEST
 * 090 PUSH1 40
 * 092 MLOAD
 * 093 DUP1
 * 094 SWAP2
 * 095 SUB
 * 096 SWAP1
 * 097 RETURN
 * 098 JUMPDEST
 * 099 PUSH1 00
 * 101 PUSH2 006e
 * 104 DUP4
 * 105 DUP4
 * 106 PUSH2 0076
 * 109 JUMP
 * 110 JUMPDEST
 * 111 SWAP1
 * 112 POP
 * 113 SWAP3
 * 114 SWAP2
 * 115 POP
 * 116 POP
 * 117 JUMP
 * 118 JUMPDEST
 * 119 PUSH1 00
 * 121 DUP2
 * 122 DUP4
 * 123 PUSH2 0084
 * 126 SWAP2
 * 127 SWAP1
 * 128 PUSH2 0160
 * 131 JUMP
 * 132 JUMPDEST
 * 133 SWAP1
 * 134 POP
 * 135 SWAP3
 * 136 SWAP2
 * 137 POP
 * 138 POP
 * 139 JUMP
 * 140 JUMPDEST
 * 141 PUSH1 00
 * 143 DUP1
 * 144 REVERT
 * 145 JUMPDEST
 * 146 PUSH1 00
 * 148 DUP2
 * 149 SWAP1
 * 150 POP
 * 151 SWAP2
 * 152 SWAP1
 * 153 POP
 * 154 JUMP
 * 155 JUMPDEST
 * 156 PUSH2 00a4
 * 159 DUP2
 * 160 PUSH2 0091
 * 163 JUMP
 * 164 JUMPDEST
 * 165 DUP2
 * 166 EQ
 * 167 PUSH2 00af
 * 170 JUMPI
 * 171 PUSH1 00
 * 173 DUP1
 * 174 REVERT
 * 175 JUMPDEST
 * 176 POP
 * 177 JUMP
 * 178 JUMPDEST
 * 179 PUSH1 00
 * 181 DUP2
 * 182 CALLDATALOAD
 * 183 SWAP1
 * 184 POP
 * 185 PUSH2 00c1
 * 188 DUP2
 * 189 PUSH2 009b
 * 192 JUMP
 * 193 JUMPDEST
 * 194 SWAP3
 * 195 SWAP2
 * 196 POP
 * 197 POP
 * 198 JUMP
 * 199 JUMPDEST
 * 200 PUSH1 00
 * 202 DUP1
 * 203 PUSH1 40
 * 205 DUP4
 * 206 DUP6
 * 207 SUB
 * 208 SLT
 * 209 ISZERO
 * 210 PUSH2 00de
 * 213 JUMPI
 * 214 PUSH2 00dd
 * 217 PUSH2 008c
 * 220 JUMP
 */