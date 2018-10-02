pragma solidity ^0.4.24;

import "./SchedulerInterface.sol";

contract Save_Dangerous_CDP {

    uint256 constant ONE_WEEK = 60 * 60 * 24 * 7;

    address cdp;
    address clock;
    address tub;

    address futureTx;

    constructor(
        address _cdpId,
        address _scheduler,
        address _tub
    ) public {
        cdpId = _cdpId;
        clock = _scheduler;
        tub = _tub;
    }

    function newSchedule() public returns (address) {
        require(msg.sender == futureTx || msg.sender == owner);

        futureTx = SchedulerInterface(clock).schedule(
            address(this),  // to
            0,              // callData
            [               // start uint256[8]
                1000000,    // callGas
                0,          // value
                2500,       // executionWindow
                block.timestamp + ONE_WEEK, // executionStart
                5 gwei,     // gasPrice
                0,          // fee
                12500,      // bounty
                12500       // deposit

        );

        return futureTx;
    }

    function () public {
        require(msg.sender == futureTx, "Scheduled Transaction must be the one calling this contract.");
        
        if (!tub.safe(cdpId)) {
            tub.lock(cdpId, 1 ether);
        } else {
            newSchedule();
        }
    }
}
