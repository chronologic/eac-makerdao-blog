# How to Manage your CDP with the Ethereum Alarm Clock

The code supplement to the blog article [How to Manage your CDP with the Ethereum Alarm Clock]().

## Intro

The code will walk you through the code for two use cases of scheduling transaction
to interact with the MakerDAO CDP system using the Ethereum Alarm Clock. The first case 
will detail how to schedule a routine collateral check and send more ether to fill up
the CDP if the liquidation ratio is too low. The second case will show how to schedule
Dai repayments to your CDP so that you can reduce your debt position over time.

If you need help setting up the developer environment to interact with the MakerDAO and 
Ethereum Alarm Clock systems on the Kovan test network, please see [Appendix A]()


We will be making use of the following addresses on the Kovan network:

```
  EAC
  ---
  "TimestampScheduler": "0x44b28e47fe781eabf8095a2a21449a82a635745b",

  MakerDAO
  --------
  "TUB": "0xa71937147b55Deb8a530C7229C442Fd3F31b7db2",
```

## Case #1 - Save a dangerous CDP

The first case we will consider is the one where someone opens a CDP, and wants to schedule
a routine (read, recursive) check that if the CDP is in danger and if it is, send more collateral.



## Case #2 - Routine Dai payment

## Appendix A - Setting up

We will be using the Kovan network since both the Dai stablecoin system and the Ethereum
Alarm Clock scheduling service both have deployed contracts there. For more about what 
distringuishes the Kovan test network from the main Ethereum chain see [here](https://kovan-testnet.github.io/website/).
We will use Infura to handle all the node management for us.

