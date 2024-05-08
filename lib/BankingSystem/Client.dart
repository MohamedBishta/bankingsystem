import 'BankAccount.dart';

class Client{
  String name ;
  String address;
  int phone;
  BankAccount? account;
  Client(this.name,this.address,this.phone,[this.account]);

  void viewDetails() {
    print('Name  :$name');
    print('Address :$address');
    print('Phone number :$phone');
    print('Account Id :${account?.accountId}');
    print('Account balance :${account?.balance}');
  }

}