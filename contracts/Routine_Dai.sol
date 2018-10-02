pragma solidity ^0.4.24;

import "./SchedulerInterface.sol";

contract Routine_Dai {

    uint256 constant gwei = 1000000000;
    uint256 constant payAmt = 23;

    bytes32 cdpId;
    address clock;
    address dai;
    address tub;

    address futureTx;
    address owner;

    constructor(
        bytes32 _cdpId,
        address _dai,
        address _clock
    ) public {
        owner = msg.sender;
        cdpId = _cdpId;
        dai = _dai;
        clock = _clock;
    }

    function newSchedule() public returns (address) {
        require(msg.sender == futureTx || msg.sender == owner);

        uint256 scheduleFor = now + 20 minutes;

        futureTx = SchedulerInterface(clock).schedule(
            address(this),      // to
            new bytes(0),       // callData
            [                   //
                1000000,        // callGas
                0,              // value
                2500,           // executionWindow
                scheduleFor,    // executionStart
                5 * gwei,         // gasPrice
                0,              // fee
                12500,          // bounty
                12500           // deposit
            ]                   //
        );

        return futureTx;
    }

    function () public {
        require(msg.sender == futureTx, "Scheduled Transaction must be the one calling this contract.");

        // dai.transferFrom(owner, address(this), payAmt);
        // tub.wipe(cdpId, payAmt);
        // if (tub.tab(cdpId) > 0) {
        //     newSchedule();
        // }
    }
}
