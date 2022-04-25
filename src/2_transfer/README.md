# Basic StarkNet Contracts 2

0. Setting up StarkNet Network
- https://starknet.io/docs/hello_starknet/account_setup.html#setting-up-the-network

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
Contract address: 0x022766257532f330c003d581154353c65f685021442f6abe85b0599fd12b8735
Transaction hash: 0x14491f73faca4f3274e9935685144e9fc323ec8829d0b7869f60c22985468a9
```

3. find contract on explorer
- https://hackathon-0.voyager.online/contract/0x022766257532f330c003d581154353c65f685021442f6abe85b0599fd12b8735

4. install ArgentX wallet from chrome webstore
- https://chrome.google.com/webstore/detail/argent-x/dlcobpjiigpikoobohmabehhmhfoodbb

5. Create 2 accounts in ArgentX
- 1_create_account_argentX.png


6. Increase balance for account1
- 2_increase_balance_account1.png


7. send tx on account1
- 3_send_tx_1.png

8. transfer 100 to account2
- 4_transfer_100_to_account2.png

9. send tx on account1
- 5_send_tx_2.png

10. check account1 balance
- 6_check_account1_balance.png

11. check account2 balance
- 7_check_account2_balance.png


