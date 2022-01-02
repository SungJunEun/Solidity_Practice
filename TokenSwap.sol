// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import  "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Moyed is ERC20 {
    constructor() ERC20("MOYED", "MYD"){
        _mint(_msgSender(), 100 * 10 **18);
    }
}

contract Golden is ERC20 {
    constructor() ERC20("GOLDEN", "GLD"){
        _mint(_msgSender(), 100 * 10 **18);
    }
}

contract tokenSwap  {
    address public swap_contract;
    address public owner1;
		// Point2. Is there way to declare & intialize together in constructor?
    ERC20 public token1;
    uint256 public amount1;
    address public owner2;
    ERC20 public token2;
    uint256 public amount2;
    


    constructor(
        address owner1_, 
        address token1_,
        uint256 amount1_,
        address owner2_, 
        address token2_,
        uint256 amount2_
        ) {
						// Point1. ERC20 instance vs IERC20 instance?
            swap_contract = address(this);
            owner1 = owner1_;
            token1 = ERC20(token1_);
            amount1 = amount1_;
            owner2 = owner2_;
            token2 = ERC20(token2_);
            amount2 = amount2_;
        }
    function swap() public virtual returns(bool) {
        require(owner1 != address(0), "Can't swap from address(0)");
        require(owner2 != address(0), "Can't swap to address(0)");

        require(token1.allowance(owner1, swap_contract) >= amount1, "Not enough amount!");
        require(token2.allowance(owner2, swap_contract) >= amount2, "Not enough amount!");
				// Point3.  
        token1.transferFrom(owner1, owner2, amount1);
        token2.transferFrom(owner2, owner1, amount2);

        return true;
    }
}
