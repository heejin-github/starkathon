# Basic StarkNet Contracts 1

0. Setting up StarkNet Network
https://starknet.io/docs/hello_starknet/account_setup.html#setting-up-the-network

1. Compile
```
$ starknet-compile contract.cairo \
    --output contract_compiled.json \
    --abi contract_abi.json
```

2. Deploy
```
$ starknet deploy --contract contract_compiled.json
```
Outputs:
```
Deploy transaction was sent.
Contract address: 0x06ceb1d54627dad9a192ac5880860fe24d9424836b139c2e1f8e1127b9864daa
Transaction hash: 0x6c660fba3492ebccb2781ef083943a307231a286bd4e76ba51b70e31872c0fc
```

3. Invoke increase_balane() in contracts
```
$ starknet invoke --address 0x06ceb1d54627dad9a192ac5880860fe24d9424836b139c2e1f8e1127b9864daa \
     --abi contract_abi.json \
     --function increase_balance \
     --inputs 1234
``` 
Outputs:
```
Invoke transaction was sent.
Contract address: 0x06ceb1d54627dad9a192ac5880860fe24d9424836b139c2e1f8e1127b9864daa
Transaction hash: 0x4179d99c1f3b3ed2f76bd6258c2386e41939ad56fc58f657570936dfb4a2c6a
```

4. Check TX status
```
$ starknet tx_status --hash 0x4179d99c1f3b3ed2f76bd6258c2386e41939ad56fc58f657570936dfb4a2c6a
```
Outputs:
```
{
    "block_hash": "0x594486073fcef221e3be3fc34a725bed77f516609e13822295e00b9d9fe1098",
    "tx_status": "ACCEPTED_ON_L2"
}
```

5. Query Balance
```
$ starknet call --address 0x06ceb1d54627dad9a192ac5880860fe24d9424836b139c2e1f8e1127b9864daa \
    --abi contract_abi.json \
    --function get_balance
```
Outputs:
```
1234
```
