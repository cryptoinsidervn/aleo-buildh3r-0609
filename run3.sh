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

leo run finish "{
  owner: aleo1wutdp5g6cdzn8py5wwth9pey2kqw8xvxzcawm862vz4x3xudssfqhhfmxa.private,
  bidder: aleo10eyze8jh0ctjsevdazkygh3vdvkghds5k2ht6u2qn58mdr9mtszs44ptul.private,
  amount: 51u64.private,
  is_winner: false.private,
  _nonce: 2760896301840224981490885451100151731941928919287885514019473586512153717866group.public
}"