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

## Case #1 - Schedule a routine collateral check and fill

## Case #2 - Scheduled Dai repayment

## Appendix A - Setting up

We will be using the Kovan network since both the Dai stablecoin system and the Ethereum
Alarm Clock scheduling service both have deployed contracts there. For more about what 
distringuishes the Kovan test network from the main Ethereum chain see [here](https://kovan-testnet.github.io/website/).
We will use Infura to handle all the node management for us.

