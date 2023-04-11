#[contract]
mod BroadcastStarknet {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    #[event]
    fn Broadcast(from: ContractAddress, value: felt252) {}

    #[external]
    fn broadcast(message: felt252) {
        let caller = get_caller_address();
        Broadcast(caller, message);
    }

}