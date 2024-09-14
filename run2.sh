#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp9E2QAXLLkHKySYwtyWqCDKbUs2nMwhfsxCqLfrqq9te3
ADDRESS=aleo1wutdp5g6cdzn8py5wwth9pey2kqw8xvxzcawm862vz4x3xudssfqhhfmxa
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run resolve "{
  owner: aleo1wutdp5g6cdzn8py5wwth9pey2kqw8xvxzcawm862vz4x3xudssfqhhfmxa.private,
  bidder: aleo12skkp3nhckjfvkag8htkw8lh8mz3qrq4ly3t57qudagsvlcjgs8sm42fpp.private,
  amount: 19u64.private,
  is_winner: false.private,
  _nonce: 2769976495302067383528890980654190514976357057910761717240427151800961383488group.public
}" "{
  owner: aleo1wutdp5g6cdzn8py5wwth9pey2kqw8xvxzcawm862vz4x3xudssfqhhfmxa.private,
  bidder: aleo10eyze8jh0ctjsevdazkygh3vdvkghds5k2ht6u2qn58mdr9mtszs44ptul.private,
  amount: 51u64.private,
  is_winner: false.private,
  _nonce: 6935443813260337306458277473786550753799783553145534579912073865759747510272group.public
}"