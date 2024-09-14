#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
We will be playing the role of three parties.

The private key and address of the first bidder.
private_key: APrivateKey1zkp6KdacbVL7voeAMaMLmBGEXLPF1FTQFwM51xQQR2RmSv6
address : aleo12skkp3nhckjfvkag8htkw8lh8mz3qrq4ly3t57qudagsvlcjgs8sm42fpp

The private key and address of the second bidder.
private_key: APrivateKey1zkp5uHPnawDXYBYRXkCkxMDkHJb4fQUGEdmXP61bDTMTnme
address: aleo10eyze8jh0ctjsevdazkygh3vdvkghds5k2ht6u2qn58mdr9mtszs44ptul

The private key and address of the auctioneer.
private_key: APrivateKey1zkp9E2QAXLLkHKySYwtyWqCDKbUs2nMwhfsxCqLfrqq9te3
address: aleo1wutdp5g6cdzn8py5wwth9pey2kqw8xvxzcawm862vz4x3xudssfqhhfmxa
"

echo "
Let's start an auction!

###############################################################################
########                                                               ########
########           Step 0: Initialize a new 2-party auction            ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |         |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

# echo "
# Let's take the role of the first bidder - we'll swap in the private key and address of the first bidder to .env.

# We're going to run the transition function "place_bid", slotting in the first bidder's public address and the amount that is being bid. The inputs are the user's public address and the amount being bid.

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp6KdacbVL7voeAMaMLmBGEXLPF1FTQFwM51xQQR2RmSv6
ADDRESS=aleo12skkp3nhckjfvkag8htkw8lh8mz3qrq4ly3t57qudagsvlcjgs8sm42fpp
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run place_bid $ADDRESS 19u64


echo "
###############################################################################
########                                                               ########
########         Step 1: The first bidder places a bid of 19           ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |  19    |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

#

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp5uHPnawDXYBYRXkCkxMDkHJb4fQUGEdmXP61bDTMTnme
ADDRESS=aleo10eyze8jh0ctjsevdazkygh3vdvkghds5k2ht6u2qn58mdr9mtszs44ptul
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

# Have the second bidder place a bid of 90.
leo run place_bid $ADDRESS 51u64

echo "
###############################################################################
########                                                               ########
########          Step 2: The second bidder places a bid of 51 .         ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |   19    |   51    |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"