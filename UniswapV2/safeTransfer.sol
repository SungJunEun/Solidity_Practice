// SPDX-License-Identifier: MIT
pragma solidity =0.8.0;

import "https://github.com/Uniswap/v2-core/blob/master/contracts/UniswapV2ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract TOKEN is ERC20 {
    constructor() ERC20("MOYED", "MYD") {
        _mint(_msgSender(), 1000*10**18);
    }
}

contract MyContract {
    bytes4 private constant SELECTOR = bytes4(keccak256(bytes('transfer(address,uint256)')));
    function returnSender() public returns(address) {
        return msg.sender;
    } 
    function safeTransfer(address token, address to, uint value) public  {
        
        // Equivalent to ERC20(token).transfer(to,value);
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(SELECTOR, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'UniswapV2: TRANSFER_FAILED');
    }
}
