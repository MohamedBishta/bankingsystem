import 'package:untitled3/BankingSystem/Client.dart';

class BankAccount{
  static int IDESGENERATOR = 1000;
  int accountId = IDESGENERATOR;
  double balance;
  Client? owner;

  BankAccount([this.balance = 0]){
    accountId = IDESGENERATOR++;
  }
  bool withDraw(double amount){
    if(amount <= 0){
      print('Invalid amount ');
      return false ;
    }
    if(amount > balance){
      print('the balance is not sufficient');
      return false;
    }
     balance-=amount;
     return  true;
  }
  bool deposit(double amount){
    if(amount <= 0 ){
      print('Invalid amount ');
      return false ;
    }
    balance+=amount;
    return true;
  }
  void viewDetails(){
    print('The Basic Bank Account');
    print('Account Id :$accountId');
    print('Balance :$balance');
    print('Client name :${owner?.name}');
    print('Client address :${owner?.address}');
    print('Client phone :${owner?.phone}');
  }

} 