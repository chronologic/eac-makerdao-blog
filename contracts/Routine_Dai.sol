pragma solidity ^0.4.24;

contract Routine_Dai {

    uint256 constant ONE_WEEK = 60 * 60 * 24 * 7;

    uint256 cdpId;
    address clock;
    address dai;
    address tub;

    address futureTx;

    constructor(
        address _cdpId,
        address _dai,
        address _clock
    ) public {
        cdpId = _cdpId;
        dai = _dai;
        clock = _clock;
    }

    function newSchedule() public returns (address) {
        require(msg.sender == futureTx || msg.sender == owner);

        futureTx = SchedulerInterface(clock).schedule(
            address(this),
            0,
            [
                1000000,
                0,
                2500,
                block.timestamp + ONE_WEEK,
                5 gwei,
                0,
                12500,
                12500
            ]
        );

        return futureTx;
    }

    function () public {
        require(msg.sender == futureTx, "Scheduled Transaction must be the one calling this contract.");

        dai.transferFrom(owner, address(this), payAmt);
        tub.wipe(cdpId, payAmt);
        if (tub.tab(cdpId) > 0) {
            newSchedule();
        }
    }
}
