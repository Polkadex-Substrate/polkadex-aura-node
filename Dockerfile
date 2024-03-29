FROM ubuntu:16.04
RUN apt-get -y update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt install -y cmake pkg-config libssl-dev git build-essential clang libclang-dev curl
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup toolchain install nightly-2020-09-28 && rustup default nightly-2020-09-28 && rustup override set nightly-2020-09-28 && rustup target add wasm32-unknown-unknown --toolchain nightly-2020-09-28
COPY . /polkadex-aura-node/
RUN cd /polkadex-aura-node &&  cargo build --release
RUN /polkadex-aura-node/scripts/createCustomSpec.sh
RUN chmod +x /polkadex-aura-node/scripts/docker-compose/observer.sh && chmod +x /polkadex-aura-node/scripts/docker-compose/bootnode_alice.sh && chmod +x /polkadex-aura-node/scripts/docker-compose/validator_charlie.sh && chmod +x /polkadex-aura-node/scripts/docker-compose/validator_bob.sh
