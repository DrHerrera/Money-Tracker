import 'package:flutter/material.dart';
import 'package:moneytraker/controler/transaction_provider.dart';
import 'package:moneytraker/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final type = transaction.type == TransactionType.income
                ? 'Income'
                : 'Expenses';
            final value = transaction.type == TransactionType.expenses
                ? '-\$ ${transaction.amount.abs().toStringAsFixed(2)}'
                : '\$ ${transaction.amount.toStringAsFixed(2)}';
            final color = transaction.type == TransactionType.expenses
                ? Colors.red
                : Colors.teal;

            return ListTile(
              title: Text(transaction.description),
              subtitle: Text(type),
              trailing: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
