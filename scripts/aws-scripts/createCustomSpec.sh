#!/bin/bash
/polkadex-aura-node/target/release/node-polkadex build-spec  --chain local > /polkadex-aura-node/scripts/customSpec.json
/polkadex-aura-node/target/release/node-polkadex build-spec --chain=customSpec.json --raw > /polkadex-aura-node/scripts/customSpecRaw.json
