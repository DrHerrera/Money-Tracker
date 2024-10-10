import 'package:flutter/material.dart';
import 'package:moneytraker/view/components/add_transaction_dialog.dart';
import 'package:moneytraker/view/components/home_header.dart';
import 'package:moneytraker/view/components/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: const SafeArea(
          bottom: false,
          child: Column(
            children: [
              HomeHeader(),
              TransactionList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            //mostrar un dialogo bottom sheet para agregar transacciones
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const AddTransactionDialog();
              },
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
