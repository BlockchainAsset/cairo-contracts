#[contract]
mod Splitter {
    use starknet::get_caller_address;
    use starknet::ContractAddress;
    use starknet::ContractAddressIntoFelt252;
    use traits::Into;
    use traits::TryInto;
    use box::BoxTrait;

    struct Storage {
        balances: LegacyMap<ContractAddress, u128>
    }

    // EVENTS

    #[event]
    fn BalanceAdded(user: ContractAddress, amount: u128) {}

    // VIEW FUNCTIONS

    // Function overloading not possible right now.
    // #[view]
    // fn get_balance() -> u128 {
    //     balances::read(get_caller_address())
    // }

    #[view]
    fn get_balance(user: ContractAddress) -> u128 {
        balances::read(user)
    }

    // EXTERNAL FUNCTIONS

    #[external]
    fn split(amount: u128, userA: ContractAddress, userB: ContractAddress) {
        let mut splitAmount: u128 = amount / 2_u128;        

        if ((splitAmount * 2_u128) != amount) {
            // writeBalanceAndEmit(get_caller_address(), 1_u128);
            writeBalanceAndEmit(get_caller_address(), amount - splitAmount * 2_u128);
        }

        writeBalanceAndEmit(userA, splitAmount);
        writeBalanceAndEmit(userB, splitAmount);
    }

    // INTERNAL FUNCTIONS

    fn writeBalanceAndEmit(user: ContractAddress, amount: u128) {
        let currentBalance: u128 = balances::read(user);
        balances::write(user, currentBalance + amount);
        BalanceAdded(user, amount);
    }
}