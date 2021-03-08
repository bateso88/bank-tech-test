## Planning 

#### Classes 
1. BankAccount
2. Statement
3. Transaction

#### Methods: 

###### BankAccount
1. deposit(value)
2. withdraw(value)

###### Statement
1. add_transaction
2. transactions
3. update_balance
4. print

###### Transaction (all attributes)
1. date
2. credit
3. debit
4. balance

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories
```
As a client
So that I can keep my money safe in a bank
I want to be able to deposit money to an account
```

```
As a client
So that I can use my money currently in a bank
I want to be able to withdraw my money
```

```
As a client
So that I can be reminded of when I made a transaction
I want to be able to see the date the transaction was made
```

```
As a client
So that I can remember all transactions I have made
I want to be able to print my bank statement
```