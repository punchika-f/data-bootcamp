class ATM:
	pass
	
then

class ATM :
  def __init__(self, name, balance, bank) :
    self.name = name
    self.balance = balance
    self.bank = bank
  
  def deposit(self, amt) :
    self.balance += amt
    print(f"Deposit {amt} successfully")

  def check_balance(self) :
    print(f"Your current balance is {self.balance}")

  def withdraw(self, amt) :
    if self.balance >= amt :
      self.balance -= amt
      print(f"Withdraw {amt} successfully")
    else :
      print("Insufficient balance")

  def transfer(self, amt) :
    if self.balance >= amt :
      self.balance -= amt
      input ("Please provide account pin : ")
      print(f"Transfer {amt} successfully")
    else :
      print("Insufficient balance")

  def update_book(self) :
    input("please provide your pin : ")
    print("update book successfully")
