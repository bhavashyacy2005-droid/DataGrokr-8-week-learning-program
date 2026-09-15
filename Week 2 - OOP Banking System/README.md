# OOP Banking System

This is my Week 2 Python mini-project. I built a simple banking system using **Object-Oriented Programming (OOP)** and used **Pandas** to work with a CSV file containing banking transaction data.

The main purpose of this project was to practice creating classes and objects while also getting some hands-on experience with reading and analyzing data using Pandas.

## What the Project Does

The banking system allows me to:

* Create a bank account using a Python class
* Check the account balance
* Deposit money
* Withdraw money
* View transaction data
* Read transaction data from a CSV file
* Perform some basic analysis on the transaction data

## Python Concepts Used

I used the following concepts in this project:

* Classes and Objects
* Constructor (`__init__`)
* Class methods
* Instance variables
* Conditional statements
* Loops
* Functions
* User input
* Pandas
* CSV file handling

## CSV Data Analysis

For the data analysis part, I used a publicly available banking transaction dataset.

The CSV file is loaded using Pandas:

```python
data = pd.read_csv("bank_transactions_data_2.csv")
```

Some of the analysis performed includes:

* Finding the total number of transactions
* Finding the total transaction amount
* Calculating the average transaction amount
* Checking different transaction types
* Counting transactions by account/customer

## Project Structure

```text
Week-2-OOP-Banking-System/
│
├── README.md
├── OOP_bank_system.py
└── transactions.csv
```

## How to Run

First, make sure Python is installed on your system.

Install Pandas if it is not already installed:

```bash
pip install pandas
```

Then run the Python file:

```bash
python bank_system.py
```

The CSV file should be kept in the same folder as the Python file.

## Sample Menu

```text
===== BANKING SYSTEM =====

1. Check Balance
2. Deposit Money
3. Withdraw Money
4. View Transaction History
5. Analyze CSV Data
6. Exit
```


This project helped me connect the Python concepts I learned in Week 2 with a practical example.

