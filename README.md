# Cairo Contracts

A collection of smart contracts written in Cairo 1.0 (Starknet).

## Code, Class Hash & Contracts

### Broadcast
A simple cairo contract inspired from [`hello_starknet.cairo`](https://github.com/starknet-edu/deploy-cairo1-demo/blob/master/hello_starknet.cairo) to broadcast a message to starknet.

Code: [`broadcast.cairo`](./src/broadcast.cairo)

Class Hash: [`0x45971ddf5228a8977d069efed7752c2a42682ce718b3f491abd363e92dd53ea`](https://goerli.voyager.online/class/0x045971ddf5228a8977d069efed7752c2a42682ce718b3f491abd363e92dd53ea)

Contract: [`0x06c764c0404108a7ad63a24ef6aa3efe0f1e772a50887fe9d01d222efd73bc44`](https://goerli.voyager.online/contract/0x06c764c0404108a7ad63a24ef6aa3efe0f1e772a50887fe9d01d222efd73bc44)

### Splitter
A simple cairo contract to split input value to equal halfs. If odd number is passed, the caller get's the remainder of `input % 2`.

Code: [`splitter.cairo`](./src/splitter.cairo)

Class Hash: [`0x3dfd8297fdda6915d612488b1dd6ef2abe8b4b30a2c2e208ce77ac68d143221`](https://goerli.voyager.online/class/0x3dfd8297fdda6915d612488b1dd6ef2abe8b4b30a2c2e208ce77ac68d143221)

Contract: [`0x004dd1cb276858514dd823d3a4e3b1d74f7275a630addf79a3a5da0561777097`](https://goerli.voyager.online/contract/0x004dd1cb276858514dd823d3a4e3b1d74f7275a630addf79a3a5da0561777097)

### Get Pedersen

A simple cairo contract to get the pedersen hash of a `felt` value and a contract address.

Code: [get_pedersen.cairo](./src/get_pedersen.cairo)

Class Hash: [`0x7e0216cf4a0b1bb739cd7229ff0ae4f1fdc918b76acb4abab3477ecfde3f036`](https://goerli.voyager.online/class/0x7e0216cf4a0b1bb739cd7229ff0ae4f1fdc918b76acb4abab3477ecfde3f036)

Contract: [`0x053487b54e42d7e42a31b9135d12cd49b7a0f6b97043b635dac1fb2e7f5d5679`](https://goerli.voyager.online/contract/0x053487b54e42d7e42a31b9135d12cd49b7a0f6b97043b635dac1fb2e7f5d5679)

## Requirements

The contract should be compiled with latest version of CAIRO which can be found [here](https://github.com/starkware-libs/cairo/releases).

### Installing

Please follow this video: https://www.youtube.com/watch?v=NdP2jTQ34hY

Or the repo: https://github.com/starknet-edu/deploy-cairo1-demo

## Testing

To run the tests for this contract, you should run `cairo-test --starknet --path .` in the git root directory (the directory which has `cairo-project.toml`).

The above command only works if you have added the PATH. If not, you have to run from the installed Cairo repository:

`cargo run --bin cairo-test -- --starknet --path ./specify/path/to/this/repo`

## Deployment

You can deploy the contracts in the `src` folder as mentioned below.

### Compilation

To store the compiled contracts, we have created a `compiled` folder in root.

Then, you can use the below command to compile from CAIRO to Sierra:

```
starknet-compile ./src/FILENAME.cairo ./compiled/FILENAME.json --replace-ids
```

If you didn't specified CAIRO in PATH, you can use the below command within the `cairo` folder:

```
cargo run --bin starknet-compile -- ./src/FILENAME.cairo ./compiled/FILENAME.json --replace-ids
```

### Account or Wallet

An account or wallet is required to create contracts.

#### New Account

You can use this repo: https://github.com/starknet-edu/deploy-cairo1-demo to know more about how to create a new account.

#### Old Account

If you already have an account, then you can simply add the `private_key`, `address` and mark `deployed` to be `true` in `./starknet_accounts/starknet_open_zeppelin_accounts.json` or in similarly named files in that folder.

NOTE: Using an old account, might lead to `StarknetErrorCode.ENTRY_POINT_NOT_FOUND_IN_CONTRACT` error. In those cases, creating a fresh account, and transferring some ETH from old account to the new one is advised.

### Contract Declaration

Now, it's time to `declare` the contract.

```
starknet declare --contract compiled/filename.json --account version11.0
```

You can expect a response like this:

```
Sending the transaction with max_fee: 0.000XXX ETH (XXX WEI).
Declare transaction was sent.
Contract class hash: 0x...
Transaction hash: 0x...
```

NOTE: If you are declaring the same contract, then you will run into an error, as the class hash is already declated.

### Contract Deployment

Now to deploy a contract, use the below command:

```
starknet deploy --class_hash <class_hash> --account version11.0
```

The `<class_hash>` is the class hash taken from the output of declare command.

## Disclaimer

This is for learning, not for production. And as CAIRO is improving each day, some of the code may not work after some time due to those changes.

## Inspiration

https://github.com/starknet-edu/deploy-cairo1-demo

https://github.com/Kalzak/RockPaperScissors-Cairo

https://github.com/shramee/starklings-cairo1

https://www.youtube.com/watch?v=NdP2jTQ34hY