# Declare this file as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import assert_nn
from starkware.starknet.common.syscalls import get_caller_address

# Define a storage variable.
@storage_var
func balance(user : felt) -> (res : felt):
end

# Increases the balance by the given amount.
@external
func increase_balance{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(amount : felt):
    with_attr error_message(
        "Amount must be positive. Got: {amount}."):
        assert_nn(amount)
    end

    let (user) = get_caller_address()

    let (res) = balance.read(user=user)
    balance.write(user, res + amount)
    return ()
end

@external
func transfer{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(receipent : felt, amount : felt):
    with_attr error_message(
        "Amount must be positive. got: {amount}."):
        assert_nn(amount)
    end

    let (sender) = get_caller_address()
    let (balance_sender) = balance.read(user=sender)
    balance.write(sender, balance_sender - amount)

    let (balance_receipent) = balance.read(user=receipent)
    balance.write(receipent, balance_receipent + amount)

    return()
end
# Returns the current balance.
@view
func get_balance{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(user : felt) -> (res : felt):
    let (res) = balance.read(user=user)
    return (res)
end
