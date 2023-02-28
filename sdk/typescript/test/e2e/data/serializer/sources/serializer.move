// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module serializer::serializer_tests {
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::clock::{Self, Clock};

    public entry fun list<T: key + store, C>(
        item: T,
        ctx: &mut TxContext
    ) {
        transfer::transfer(item, tx_context::sender(ctx))
    }

    public fun return_struct<T: key + store>(
        item: T,
    ): T {
        item
    }

    public entry fun timestamp_ms(clock: &Clock) {
        clock::timestamp_ms(clock);
    }

    public fun test_abort() {
        abort 0
    }
}