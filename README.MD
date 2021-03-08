## Installation 

To install this programme, first fork and clone this repo.  
Navigate to the directory and run `bundle install` in the command line.  
To run the code in IRB use the command `irb -r './lib/bank_account'`.  
To run the tests, type `rspec`

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
1. update
2. view

###### Transaction (attributes)
1. date
2. credit
3. debit
4. balance

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

## Approach

##### My approach to designing this solution was as follows:  
1. Planning 
  - I did the above planning to calculate in advance what sort of classes and methods I would need to succeed.
  - I then wrote some user stories to give my progress some structure.
2. TDD and OOP
  - I started writing code using TDD. I worked my way through the user stories by writing tests, passing them and refactoring. I maintained 100% coverage throughout. 
  - I used OOP to break down all the problems into smaller ones and make writing the solution easier for myself.

## Structure 
##### I structured my code as follows:
As per my planning, I had three classes:   
1. BankAccount
2. Statement
3. Transaction  
I used three classes so that I could fulfill the SRP.  

The BankAccount class's responsibility is to create a new transaction (either a withdrawal or deposit), via the statement.   
The Statement class's responsibility is to show a list of all transactions.  
The Transaction class's responsibility is to store information about the transaction.

## Dependencies

I used the following gems for this app:  
- rspec
  - For testing
- rubocop 
  - To linter
- simplecov 
  - To test for coverage

## Acceptance criteria

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

To achieve this result (with accurate dates), run the following commands in IRB:  
```
> account = BankAccount.new 
> account.deposit(1000)
> account.deposit(2000)  
> account.withdraw(500)  
> account.statement.view
```
