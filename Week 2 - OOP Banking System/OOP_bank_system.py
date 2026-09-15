import pandas as pd
from datetime import datetime


class BankAccount:

    def __init__(self, account_number, name, balance=0):
        self.account_number = account_number
        self.name = name
        self.balance = balance

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print("Amount deposited successfully.")
        else:
            print("Enter a valid amount.")

    def withdraw(self, amount):
        if amount > self.balance:
            print("Insufficient balance.")
        elif amount > 0:
            self.balance -= amount
            print("Amount withdrawn successfully.")
        else:
            print("Enter a valid amount.")

    def show_balance(self):
        print("Account Number:", self.account_number)
        print("Account Holder:", self.name)
        print("Current Balance: ₹", self.balance)


def show_transactions():
    try:
        data = pd.read_csv("transactions.csv")

        print("\n===== TRANSACTION HISTORY =====")
        print(data)

    except FileNotFoundError:
        print("transactions.csv file not found.")


def analyze_transactions():
    try:
        data = pd.read_csv("transactions.csv")

        print("\n===== TRANSACTION ANALYSIS =====")

        total_transactions = len(data)
        print("Total Transactions:", total_transactions)

        deposits = data[data["Transaction_Type"] == "Deposit"]
        withdrawals = data[data["Transaction_Type"] == "Withdrawal"]

        print("Total Deposits: ₹", deposits["Amount"].sum())
        print("Total Withdrawals: ₹", withdrawals["Amount"].sum())

        print("\nNumber of Deposits:", len(deposits))
        print("Number of Withdrawals:", len(withdrawals))

        print("\nAverage Transaction Amount: ₹",
              round(data["Amount"].mean(), 2))

        print("\nTransactions by Account:")
        print(data["Account_Number"].value_counts())

    except FileNotFoundError:
        print("transactions.csv file not found.")


def main():

    account = BankAccount("1001", "Bhavashya", 5000)

    while True:

        print("\n===== BANKING SYSTEM =====")
        print("1. Check Balance")
        print("2. Deposit Money")
        print("3. Withdraw Money")
        print("4. View Transaction History")
        print("5. Analyze CSV Data")
        print("6. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            account.show_balance()

        elif choice == "2":
            amount = float(input("Enter amount to deposit: "))
            account.deposit(amount)

        elif choice == "3":
            amount = float(input("Enter amount to withdraw: "))
            account.withdraw(amount)

        elif choice == "4":
            show_transactions()

        elif choice == "5":
            analyze_transactions()

        elif choice == "6":
            print("Thank you for using the banking system.")
            break

        else:
            print("Invalid choice. Please try again.")


main()