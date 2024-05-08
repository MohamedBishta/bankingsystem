import 'dart:io';

import 'package:untitled3/BankingSystem/BankAccount.dart';
import 'package:untitled3/BankingSystem/Client.dart';
import 'package:untitled3/BankingSystem/SavingsBankAccount.dart';

class BankingSystem{
  List<BankAccount> allAccounts = [];
  List<Client> allClients = [];

  BankingSystem(){
    addTestData();
  }
  void showAllAccounts() {
    for(int i=0;i<allAccounts.length;i++){
      print("--------------------------------");
      allAccounts[i].viewDetails();
    }
  }

  addTestData(){
    for(int i=0;i<20;i++){
      BankAccount account = BankAccount(i*1000);
      Client client = Client("Client num $i", "zinarah", 1234);
      client.account = account;
      account.owner = client;
      allAccounts.add(account);
      allClients.add(client);
    }

  }
  BankAccount? getAccountById(accountId){
    for(int i=0; i<allAccounts.length;i++){
      if(allAccounts[i].accountId == accountId){
        return allAccounts[i];
      }
    }
    return null;
  }
  void deleteAccount(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!.trim());
    BankAccount? account = getAccountById(accountId);
    if(account == null){
      print('invalid id');
      return;
    }
    allAccounts.remove(account);
    Client? clientPTR = account.owner;
    account.owner?.account = null;
    account.owner = null;
    allClients.remove(clientPTR);
    clientPTR = null;
  }
  void deposit(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!.trim());
    BankAccount? account = getAccountById(accountId);
    if(account == null){
      print('invalid id');
      return;
    }
    print('Please Enter amount to deposit ');
    double amount =double.parse(stdin.readLineSync()!.trim());
    if(account.deposit(amount)){
      print('Successful transaction');
    }
  }
  void withdraw(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!.trim());
    BankAccount? account = getAccountById(accountId);
    if(account == null){
      print('invalid id');
      return;
    }
    print('Please Enter amount to withdraw ');
    double amount =double.parse(stdin.readLineSync()!.trim());
    if(account.withDraw(amount)){
      print('Successful transaction');
    }
  }
  void createAccount(){
    print('please Enter Client name');
    String name = stdin.readLineSync()!.trim();
    print('please Enter Client address');
    String address = stdin.readLineSync()!.trim();
    print('please Enter Client phone');
    int  phone = int.parse(stdin.readLineSync()!.trim());
    Client client = Client(name, address, phone);
    print('Please Enter Initial balance');
    double  balance = double.parse(stdin.readLineSync()!.trim());

    print('Please chose account type'
        '1- Basic Bank account '
        '2- savings Bank account ');
    int accountType = int.parse(stdin.readLineSync()!.trim());
    BankAccount account ;
    if(accountType == 1){
      account = BankAccount(balance);
    }else{
      print('Please Enter minimum balance');
      double minimumBalance = double.parse(stdin.readLineSync()!.trim());
      account = SavingsBankAccount(balance, minimumBalance);
    }
    account.owner = client;
    client.account = account;
    allClients.add(client);
    allAccounts.add(account);
    print('Account Added Successfully');
  }
  void showMenu (){
    while(true){
      print('1- Create Account ');
      print('2- show All Accounts ');
      print('3- show Account Details ');
      print('4- Delete Account ');
      print('5- Withdraw ');
      print('6- Deposit ');
      print('7- Exit ');

      int option = int.parse(stdin.readLineSync()!.trim());
      if(option == 1){
        createAccount();
      }else if(option == 2){
        showAllAccounts();
      }else if(option == 3){
        print('Please Enter Account Id');
        int accountId = int.parse(stdin.readLineSync()!.trim());
        BankAccount? account = getAccountById(accountId);
        if(account == null){
          print('invalid id');
          return;
        }
        print('--------------------------------');
        account.viewDetails();
      }else if(option == 4){
        deleteAccount();
      }else if(option == 5){
        withdraw();
      }else if(option == 6){
        deposit();
      }else if(option == 7){
       return ;
      }
    }
  }

}