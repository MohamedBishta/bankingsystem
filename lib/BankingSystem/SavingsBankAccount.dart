import 'package:untitled3/BankingSystem/BankAccount.dart';

class SavingsBankAccount extends BankAccount{
  double minimumBalance ;
  SavingsBankAccount(balance,this.minimumBalance):super(balance);
  @override
  bool withDraw(double amount) {
    if(balance - amount < minimumBalance){
      print('the balance should be greater than minimum balance');
      return false;
    }
    return super.withDraw(amount);
  }
  @override
  bool deposit(double amount) {
    if(amount < 100){
      print('amount should be greater than 100 L.E');
      return false;
    }
   return    super.deposit(amount);
  }
  @override
  void viewDetails() {
    print('Saving Bank Account');
    print('Account Id :$accountId');
    print('Balance :$balance');
    print('Minimum Balance :$minimumBalance');
    print('Name  :${owner?.name}');
    print('Address :${owner?.address}');
    print('Phone number :${owner?.phone}');
  }
}