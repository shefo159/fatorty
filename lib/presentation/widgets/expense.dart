import 'package:flutter/material.dart';

import '../../business/expense_controller.dart';
import '../../data/models/expense.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title, style: theme.textTheme.titleMedium),
              SizedBox(height: 4),
              Text('\$${expense.amount}', style: theme.textTheme.bodyLarge),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ExpenseController().getFormattedDate(expense.date), style: theme.textTheme.bodyMedium),
              SizedBox(width: 6),
              Icon(ExpenseController().getCategoryIcon(expense.category), color: theme.colorScheme.inverseSurface),
            ],
          )
        ],
      ),
    );
  }
}
