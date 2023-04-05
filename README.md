# Cairo Contracts

A list of smart contracts written in Cairo 1.0 for StarkNet.

## Requirements

The contract should be compiled with `cairo-lang-starknet 1.0.0-alpha.6` which can be found [here](https://github.com/starkware-libs/cairo/releases/tag/v1.0.0-alpha.6).

### Installing

If you're installing Cairo for the first time:

```
git clone https://github.com/starkware-libs/cairo/
cd cairo
git checkout 9c190561ce1e8323665857f1a77082925c817b4c
cargo build --all --release
```

If you already have Cairo installed:

```
cd cairo
git fetch && git pull
git checkout 9c190561ce1e8323665857f1a77082925c817b4c
cargo build --all --release
```

At this point you have Cairo installed in this repository. Adding path to your shell makes it easy to run the tests.

## Testing

To run the tests for this contract, you should run `cairo-test --starknet --path .` in the git root directory (the directory which has `cairo-project.toml`).

The above command only works if you have added the PATH. If not, you have to run from the installed Cairo repository:

`cargo run --bin cairo-test -- --starknet --path ./specify/path/to/this/repo`