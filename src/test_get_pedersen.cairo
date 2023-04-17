use src::GetPedersen;

use starknet::ContractAddress;
use starknet::contract_address_to_felt252;
use starknet::Felt252TryIntoContractAddress;
use traits::TryInto;
use starknet::OptionTrait;

// TESTS

#[test]
#[available_gas(2000000)]
fn check_pedersen() {
    let value: felt252 = 123;
    let user: ContractAddress = get_address(1);
    let result: felt252 = hash::pedersen(value, contract_address_to_felt252(user));
    assert(result == GetPedersen::get_pedersen(value, user), 'Wrong pedersen');
}

// HELPER FUNCTIONS

fn get_address(value: felt252) -> ContractAddress {
    value.try_into().unwrap()
}