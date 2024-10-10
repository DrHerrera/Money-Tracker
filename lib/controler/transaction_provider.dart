import 'package:flutter/material.dart';
import 'package:moneytraker/model/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      amount: 1000.00,
      description: 'Salary',
      type: TransactionType.income,
    ),
    Transaction(
      amount: -500.00,
      description: 'Renta',
      type: TransactionType.expenses,
    ),
  ];
  List<Transaction> get transactions => _transactions;
  double getTotalIncomes() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getTotalExpenses() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.expenses)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getBalance() {
    return getTotalIncomes() + getTotalExpenses();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
