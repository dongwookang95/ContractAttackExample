ReEntrancy Attack?
- A contract's function makes external calls with untrusted contract. 
- The untrusted contract repeatedly calls the original function before it finishes executing.

1. The thief sends 1 ether in order to pass the balance check
2. The thief calls withdraw function immediately after deposit 
3. So the contract will recognise the caller has balance > 0 (This is the beginning of Reentrancy Attack)
4. Then It is makes the external calls -> but the only check is require(bal>0), which is true
5. It recursively calls the withdraw until the bank's balance = 0


Solution
1. Checks for each change
2. Update state
3. External calls