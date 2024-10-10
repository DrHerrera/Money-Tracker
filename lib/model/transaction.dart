class Transaction {
  final double amount;
  final String description;
  final TransactionType type;

  Transaction({
    required this.amount,
    required this.description,
    required this.type,
  });
}

enum TransactionType { income, expenses }
