// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenTimeLock is Ownable {
    event TokensLocked(
        uint256 amount,
        uint256 releaseAmount,
        uint256 start,
        uint256[] releaseTimes
    );
    event TokensReleased(uint256 amount);

    address public token;
    uint256 public amount;
    uint256 public releaseAmount;
    uint256 public start;
    uint256[] public releaseTimes;

    uint256 public erc20Released;

    constructor(
        address token_,
        uint256 amount_,
        uint256 releaseAmount_,
        uint256 start_,
        uint256[] memory releaseTimes_
    ) {
        require(token_ != address(0), "Token is the zero address");
        require(amount_ > 0, "Total amount should be greater than 0");
        require(releaseAmount_ > 0, "Release amount should be greater than 0");
        require(start_ > block.timestamp, "Start time must be in the future");
        require(
            releaseTimes_.length > 0,
            "Release time must more than release time"
        );
        require(
            releaseTimes_[0] > block.timestamp,
            "Release time must be in the future"
        );
        require(
            releaseTimes_[0] > start_,
            "Release time must more than release time"
        );

        for (uint8 i = 1; i < releaseTimes_.length; i++) {
            require(
                releaseTimes_[i] > releaseTimes_[i - 1],
                "Release times must be in ascending order and unique."
            );
        }

        token = token_;
        amount = amount_;
        releaseAmount = releaseAmount_;
        start = start_;
        releaseTimes = releaseTimes_;

        emit TokensLocked(amount_, releaseAmount_, start_, releaseTimes_);
    }

    function release() public onlyOwner {
        uint256 releasable = releaseRemain();
        if (releasable > 0) {
            erc20Released += releasable;
            emit TokensReleased(releasable);
            IERC20(token).transfer(msg.sender, releasable);
        }
    }

    function releaseRemain() public view returns (uint256) {
        return vestedAmount(uint256(block.timestamp)) - erc20Released;
    }

    function vestedAmount(uint256 timestamp) public view returns (uint256) {
        if (timestamp < releaseTimes[0]) {
            return 0;
        }
        if (timestamp >= releaseTimes[releaseTimes.length - 1]) {
            return amount;
        }
        uint256 release;
        for (uint8 i = 0; i < releaseTimes.length; i++) {
            if (timestamp >= releaseTimes[i]) {
                release = (i + 1) * releaseAmount;
            } else {
                break;
            }
        }
        return release;
    }
}
