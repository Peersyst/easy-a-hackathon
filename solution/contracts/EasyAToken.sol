// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EasyAToken is ERC20 {
    constructor() ERC20("Token", "EasyAToken") {}

    function buy() public payable {
        require(msg.value > 0, "You must send some XRP to get tokens");
        _mint(msg.sender, msg.value);
    }
}
