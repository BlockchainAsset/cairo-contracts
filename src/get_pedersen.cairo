#[contract]
mod GetPedersen {
    use starknet::get_caller_address;
    use starknet::ContractAddress;
    use starknet::contract_address_to_felt252;

    #[view]
    fn get_pedersen(nonce: felt252, addr: ContractAddress) -> felt252 {
        let param1: felt252 = nonce;
        let param2: felt252 = contract_address_to_felt252(addr);
        
        hash::pedersen(param1,param2)
    }

}