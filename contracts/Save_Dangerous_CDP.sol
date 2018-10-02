pragma solidity ^0.4.24;

import "./SchedulerInterface.sol";
// import "./MakerTub.sol";

contract ITub {
    function lad(bytes32 cup) public view returns (address);
    function safe(bytes32 _id) returns (bool);
    function lock(bytes32 _id, uint256 _amt);
}

contract Save_Dangerous_CDP {

    uint256 constant gwei = 1000000000;

    bytes32 public cdpId;
    address public clock;
    address public tub;

    address futureTx;
    address owner;

    constructor(
        bytes32 _cdpId,
        address _scheduler,
        address _tub
    ) public {
        owner = msg.sender;
        cdpId = _cdpId;
        clock = _scheduler;
        tub = _tub;
    }

    function ownerOfCdp() public view returns (address) {
        return ITub(tub).lad(cdpId);
    }

    function newSchedule() public returns (address) {
        require(msg.sender == futureTx || msg.sender == owner);

        uint256 scheduleFor = now + 6 hours;

        futureTx = SchedulerInterface(clock).schedule(
            address(this),      // to
            new bytes(0),       // callData
            [                   //
                1000000,        // callGas
                0,              // value
                2500,           // executionWindow
                scheduleFor,    // executionStart
                5 * gwei,       // gasPrice
                0,              // fee
                12500,          // bounty
                12500           // deposit
            ]                   //
        );

        return futureTx;
    }

    function () public {
        require(msg.sender == futureTx, "Scheduled Transaction must be the one calling this contract.");
        
        if (!ITub(tub).safe(cdpId)) {
            ITub(tub).lock(cdpId, 1 ether);
        } else {
            newSchedule();
        }
    }
}
